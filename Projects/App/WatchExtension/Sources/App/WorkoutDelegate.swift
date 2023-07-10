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

public class WorkoutDelegate: NSObject, ObservableObject {
    private let healthStore = HKHealthStore()
    
    private var workout: HKWorkout?
    private var workoutSession: HKWorkoutSession?
    private var liveWorkoutBuilder: HKLiveWorkoutBuilder?
    
    var workoutSessionState: HKWorkoutSessionState = .notStarted
    
    @Published public var heartRate: Double = 0
    @Published public var calorie: Double = 0
    
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
            debugPrint("live workout builder begin: \(success) \(String(describing: error))")
        }
    }
    
    func requestAuthorization(completion: @escaping (Bool, Error?) -> Void) {
        let typesToShare: Set = [
            HKQuantityType.workoutType()
        ]
        
        let typesToRead: Set = [
            HKQuantityType.quantityType(forIdentifier: .heartRate)!,
            HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!,
        ]
        
        healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead, completion: completion)
    }
}

extension WorkoutDelegate: HKWorkoutSessionDelegate {
    public func workoutSession(_ workoutSession: HKWorkoutSession,
                               didChangeTo toState: HKWorkoutSessionState,
                               from fromState: HKWorkoutSessionState, date: Date) {
        DispatchQueue.main.async {
            self.workoutSessionState = toState
        }
        
        if toState == .ended {
            liveWorkoutBuilder?.endCollection(withEnd: date) { [weak self] (success, error) in
                debugPrint("live workout builder end collection \(success) \(String(describing: error))")
                self?.liveWorkoutBuilder?.finishWorkout { (workout, error) in
                    DispatchQueue.main.async {
                        self?.workout = workout
                    }
                    debugPrint("live workout builder finish workout \(String(describing: workout)) \(String(describing: error))")
                }
            }
        }
        
        debugPrint("workout session didChangedTo \(toState) from \(fromState)")
    }
    
    public func workoutSession(_ workoutSession: HKWorkoutSession, didFailWithError error: Error) {
        debugPrint("workout session: \(workoutSession) error: \(error)")
    }
}

extension WorkoutDelegate: HKLiveWorkoutBuilderDelegate {
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
                    self.heartRate = heartRate
                    debugPrint("heart \(heartRate)")
                    
                case HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned):
                    let calorieUnit = HKUnit.kilocalorie()
                    let calorie = statistics.sumQuantity()?.doubleValue(for: calorieUnit) ?? 0
                    self.calorie = calorie
                    debugPrint("calorie \(calorie)")
                    
                default:
                    return
                }
            }
        }
    }
}
