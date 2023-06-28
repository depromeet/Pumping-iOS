//
//  WorkoutManager.swift
//  AppWatchExtension
//
//  Created by 박현우 on 2023/06/27.
//

import Foundation
import HealthKit
import ComposableArchitecture
import WatchConnectivity

public class HomeWorkoutDelegate: NSObject {
    public weak var viewStore: ViewStoreOf<HomeStore>?
    
    private let healthStore = HKHealthStore()
    
    private var workout: HKWorkout?
    private var workoutSession: HKWorkoutSession?
    private var liveWorkoutBuilder: HKLiveWorkoutBuilder?
    
    var workoutSessionState: HKWorkoutSessionState = .notStarted
    
    @Published public var heartRate: Double = 0
    
    public init(viewStore: ViewStoreOf<HomeStore>) {
        self.viewStore = viewStore
    }
    
    func pause() {
        workoutSession?.pause()
    }
    
    func resume() {
        workoutSession?.resume()
    }
    
    func endWorkout() {
        workoutSession?.end()
        workout = nil
    }
    
    func startWorkout(workoutType: HKWorkoutActivityType) {
        let configuration = HKWorkoutConfiguration()
        configuration.activityType = workoutType
        configuration.locationType = .outdoor
        
        do {
            workoutSession = try HKWorkoutSession(healthStore: healthStore, configuration: configuration)
            liveWorkoutBuilder = workoutSession?.associatedWorkoutBuilder()
        } catch {
            return
        }
        
        workoutSession?.delegate = self
        liveWorkoutBuilder?.delegate = self
        
        liveWorkoutBuilder?.dataSource = HKLiveWorkoutDataSource(
            healthStore: healthStore,
            workoutConfiguration: configuration)
        
        let startDate = Date()
        workoutSession?.startActivity(with: startDate)
        liveWorkoutBuilder?.beginCollection(withStart: startDate) { (success, error) in
            //TODO: ViewStore로 Action 처리
            debugPrint("live workout builder begin: \(success) \(error)")
        }
    }
    
    func requestAuth() {
        let typesToShare: Set = [
            HKQuantityType.workoutType()
        ]
        
        let typesToRead: Set = [
            // 심박수와 칼로리 소모만 가져옴
            HKQuantityType.quantityType(forIdentifier: .heartRate)!,
            HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!,
            //            HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!,
            //            HKQuantityType.quantityType(forIdentifier: .distanceCycling)!,
            HKObjectType.activitySummaryType()
        ]
        
        healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { (success, error) in
            DispatchQueue.main.async {
                if error != nil {
                    print(error.debugDescription)
                } else {
                    if success {
                        print("권한이 허락되었습니다")
                    } else {
                        print("권한이 없습니다")
                    }
                }
            }
        }
    }
}

extension HomeWorkoutDelegate: HKWorkoutSessionDelegate {
    public func workoutSession(_ workoutSession: HKWorkoutSession,
                               didChangeTo toState: HKWorkoutSessionState,
                               from fromState: HKWorkoutSessionState, date: Date) {
        DispatchQueue.main.async {
            self.workoutSessionState = toState
        }
        
        if toState == .ended {
            liveWorkoutBuilder?.endCollection(withEnd: date) { [weak self] (success, error) in
                debugPrint("live workout builder end collection \(success) \(error)")
                self?.liveWorkoutBuilder?.finishWorkout { (workout, error) in
                    DispatchQueue.main.async {
                        self?.workout = workout
                    }
                    debugPrint("live workout builder finish workout \(workout) \(error)")
                }
            }
        }
        
        debugPrint("workout session didChangedTo \(toState) from \(fromState)")
    }
    
    public func workoutSession(_ workoutSession: HKWorkoutSession, didFailWithError error: Error) {
        debugPrint("workout session: \(workoutSession) error: \(error)")
    }
}

extension HomeWorkoutDelegate: HKLiveWorkoutBuilderDelegate {
    public func workoutBuilderDidCollectEvent(_ workoutBuilder: HKLiveWorkoutBuilder) {
        debugPrint("workout builder did collect event: \(workoutBuilder)")
    }
    
    public func workoutBuilder(_ workoutBuilder: HKLiveWorkoutBuilder,
                               didCollectDataOf collectedTypes: Set<HKSampleType>) {
        debugPrint("workout builder did collect data of: \(workoutBuilder) did")
        for type in collectedTypes {
            guard let quantityType = type as? HKQuantityType,
                  let statistics = workoutBuilder.statistics(for: quantityType)
            else { return }
            
            debugPrint("collectedType \(statistics.quantityType)")
            DispatchQueue.main.async {
                switch statistics.quantityType {
                case HKQuantityType.quantityType(forIdentifier: .heartRate):
                    let heartRateUnit = HKUnit.count().unitDivided(by: HKUnit.minute())
                    let heartRate = statistics.mostRecentQuantity()?.doubleValue(for: heartRateUnit) ?? 0
                    //                viewStore?.send(.setHeartRate(10))
                    self.heartRate = heartRate
                    debugPrint("heart \(heartRate)")
                    //TODO: averageHeartRate 필요성 고민 후 주석 제거
                    // statistics.averageQuantity()?.doubleValue(for: heartRateUnit) ?? 0
                    
                case HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned):
                    let calorieUnit = HKUnit.kilocalorie()
                    let calorie = statistics.sumQuantity()?.doubleValue(for: calorieUnit) ?? 0
                    self.viewStore?.send(.setCalorie(Int(calorie)))
                    debugPrint("calorie \(calorie)")
                    
                default:
                    return
                }
            }
        }
    }
}

class WorkoutManager: NSObject, ObservableObject {
    
    // MARK: - Workout Metrics
    @Published var isStartWorkout: Bool = false
    @Published var averageHeartRate: Double = 0
    @Published var heartRate: Double = 0 {
        didSet {
            // 여기서 커넥티비티로 계속 쏴주면 되지 않을까?
            print("HeartRate", heartRate)
        }
    }
    @Published var activeEnergy: Double = 0 {
        didSet {
            // 여기서 커넥티비티로 계속 쏴주면 되지 않을까?
            print("Active Energy", activeEnergy)
        }
    }
    //    @Published var distance: Double = 0
    @Published var workout: HKWorkout?
    
    // MARK: - Session State Control
    @Published var running = false
    
    //    var selectedWorkout: HKWorkoutActivityType? {
    //        didSet {
    //            guard let selectedWorkout = selectedWorkout else { return }
    //            startWorkout(workoutType: selectedWorkout)
    //        }
    //    }
    
    @Published var showingSummaryView: Bool = false {
        didSet {
            if showingSummaryView == false {
                resetWorkout()
            }
        }
    }
    
    let healthStore = HKHealthStore()
    var session: HKWorkoutSession?
    var builder: HKLiveWorkoutBuilder?
    
    // Start the workout.
    func startWorkout(workoutType: HKWorkoutActivityType) {
        let configuration = HKWorkoutConfiguration()
        configuration.activityType = workoutType
        configuration.locationType = .outdoor
        
        // Create the session and obtain the workout builder.
        do {
            session = try HKWorkoutSession(healthStore: healthStore, configuration: configuration)
            builder = session?.associatedWorkoutBuilder()
        } catch {
            return
        }
        
        session?.delegate = self
        builder?.delegate = self
        
        builder?.dataSource = HKLiveWorkoutDataSource(healthStore: healthStore,
                                                      workoutConfiguration: configuration)
        
        // Start the workout session and begin data collection.
        let startDate = Date()
        session?.startActivity(with: startDate)
        builder?.beginCollection(withStart: startDate) { (success, error) in
            self.isStartWorkout = true
            print("beginCollection")
        }
    }
    
    func requestAuthorization() {
        let typesToShare: Set = [
            HKQuantityType.workoutType()
        ]
        
        let typesToRead: Set = [
            // 심박수와 칼로리 소모만 가져옴
            HKQuantityType.quantityType(forIdentifier: .heartRate)!,
            HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!,
            //            HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!,
            //            HKQuantityType.quantityType(forIdentifier: .distanceCycling)!,
            HKObjectType.activitySummaryType()
        ]
        
        healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { (success, error) in
            DispatchQueue.main.async {
                if error != nil {
                    print(error.debugDescription)
                } else {
                    if success {
                        print("권한이 허락되었습니다")
                    } else {
                        print("권한이 없습니다")
                    }
                }
            }
        }
    }
    
    
    
    func togglePause() {
        if running == true {
            self.pause()
        } else {
            resume()
        }
    }
    
    func pause() {
        session?.pause()
    }
    
    func resume() {
        session?.resume()
    }
    
    func endWorkout() {
        session?.end()
        workout = nil
        showingSummaryView = true
    }
    
    
    func updateForStatistics(_ statistics: HKStatistics?) {
        guard let statistics = statistics else {
            return
        }
        //        print("\(statistics.quantityType)",statistics.sumQuantity())
        
        DispatchQueue.main.async {
            switch statistics.quantityType {
            case HKQuantityType.quantityType(forIdentifier: .heartRate):
                let heartRateUnit = HKUnit.count().unitDivided(by: HKUnit.minute())
                self.heartRate = statistics.mostRecentQuantity()?.doubleValue(for: heartRateUnit) ?? 0
                self.averageHeartRate = statistics.averageQuantity()?.doubleValue(for: heartRateUnit) ?? 0
                
            case HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned):
                let energyUnit = HKUnit.kilocalorie()
                self.activeEnergy = statistics.sumQuantity()?.doubleValue(for: energyUnit) ?? 0
                
                //            case HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning), HKQuantityType.quantityType(forIdentifier: .distanceCycling):
                //                let meterUnit = HKUnit.meter()
                //                self.distance = statistics.sumQuantity()?.doubleValue(for: meterUnit) ?? 0
                
            default:
                return
            }
        }
    }
    
    func resetWorkout() {
        //        selectedWorkout = nil
        isStartWorkout = false
        builder = nil
        workout = nil
        session = nil
        activeEnergy = 0
        averageHeartRate = 0
        heartRate = 0
        //        distance = 0
    }
}

// MARK: - HKWorkoutSessionDelegate
extension WorkoutManager: HKWorkoutSessionDelegate {
    func workoutSession(_ workoutSession: HKWorkoutSession,
                        didChangeTo toState: HKWorkoutSessionState,
                        from fromState: HKWorkoutSessionState, date: Date) {
        DispatchQueue.main.async {
            self.running = toState == .running
        }
        
        // Wait for the session to transition states before ending the builder.
        if toState == .ended {
            builder?.endCollection(withEnd: date) { (success, error) in
                self.builder?.finishWorkout { (workout, error) in
                    DispatchQueue.main.async {
                        self.workout = workout
                    }
                }
            }
        }
    }
    
    func workoutSession(_ workoutSession: HKWorkoutSession, didFailWithError error: Error) {
        
    }
}

// MARK: - HKLiveWorkoutBuilderDelegate
extension WorkoutManager: HKLiveWorkoutBuilderDelegate {
    func workoutBuilderDidCollectEvent(_ workoutBuilder: HKLiveWorkoutBuilder) {
        
    }
    
    func workoutBuilder(_ workoutBuilder: HKLiveWorkoutBuilder,
                        didCollectDataOf collectedTypes: Set<HKSampleType>) {
        for type in collectedTypes {
            guard let quantityType = type as? HKQuantityType else {
                return
            }
            
            let statistics = workoutBuilder.statistics(for: quantityType)
            
            // Update the published values.
            updateForStatistics(statistics)
        }
    }
}
