//
//  HomeStore.swift
//  AppWatchExtension
//
//  Created by 송영모 on 2023/06/26.
//

import Foundation

import ComposableArchitecture
import HealthKit

public struct HomeStore: ReducerProtocol {
    
    public init() {}
    
    public struct State: Equatable {
        public weak var watchConnectivityDelegate: HomeWatchConnectivityDelegate?
        public weak var workoutDelegate: HomeWorkoutDelegate?
        
        public var heartRate: Int = 0
        public var calorie: Int = 0
        
        public init() { }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case setWatchConnectivityDelegate(HomeWatchConnectivityDelegate)
        case setWorkoutDelegate(HomeWorkoutDelegate)
        
        case startButtonTapped
        
        case setHeartRate(Int)
        case setCalorie(Int)

        case sendMessage(String, Int)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
                
            case let .setWatchConnectivityDelegate(watchConnectivityDelegate):
                state.watchConnectivityDelegate = watchConnectivityDelegate
                //TODO: 로직 수정 완료 후 제거
                /*
                HealthKitManager.shared.requestObserverQuery() { [watchConnectivityDelegate] (query, samplesOrNil, deletedObjectsOrNil, newAnchor, errorOrNil) in
                    guard let samples = samplesOrNil, let sample = samples.last as? HKQuantitySample else {
                        return
                    }
                    
                    
                    if sample.sampleType == .quantityType(forIdentifier: .heartRate) {
                        watchConnectivityDelegate.session?.sendMessage(
                            ["message" : sample.quantity.doubleValue(for: HKUnit(from: "count/min"))],
                            replyHandler: nil)
                    } else if sample.sampleType == .quantityType(forIdentifier: .activeEnergyBurned) {
                        watchConnectivityDelegate.session?.sendMessage(["message" : sample.quantity.doubleValue(for: HKUnit.kilocalorie())], replyHandler: nil)
                    }
                }
                 */
                return .none
                
            case let .setWorkoutDelegate(workoutDelegate):
                state.workoutDelegate = workoutDelegate
                return .none
                
            case .startButtonTapped:
                state.workoutDelegate?.startWorkout(workoutType: .functionalStrengthTraining)
                return .none
                
            case let .setHeartRate(heartRate):
                state.heartRate = heartRate
                return .send(.sendMessage("heartRate", heartRate))
                
            case let .setCalorie(calorie):
                state.calorie = calorie
                return .send(.sendMessage("calorie", calorie))

            case let .sendMessage(key, value):
                state.watchConnectivityDelegate?.session?.sendMessage([key: value], replyHandler: nil)
                return .none
            }
        }
    }
}
