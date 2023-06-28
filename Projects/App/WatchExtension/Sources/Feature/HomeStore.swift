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
        
        public init() { }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case setWatchConnectivityDelegate(HomeWatchConnectivityDelegate)
        
        case test1ButtonTapped
        case test2ButtonTapped
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
                
            case let .setWatchConnectivityDelegate(watchConnectivityDelegate):
                state.watchConnectivityDelegate = watchConnectivityDelegate
                HealthKitManager.shared.requestObserverQuery() { [watchConnectivityDelegate] (query, samplesOrNil, deletedObjectsOrNil, newAnchor, errorOrNil) in
                    guard let samples = samplesOrNil, let sample = samples.last as? HKQuantitySample else {
                        return
                    }
                    
                    print(sample)
                    
                    if sample.sampleType == .quantityType(forIdentifier: .heartRate) {
                        watchConnectivityDelegate.session?.sendMessage(
                            ["message" : sample.quantity.doubleValue(for: HKUnit(from: "count/min"))],
                            replyHandler: nil)
                    } else if sample.sampleType == .quantityType(forIdentifier: .activeEnergyBurned) {
                        watchConnectivityDelegate.session?.sendMessage(["message" : sample.quantity.doubleValue(for: HKUnit.kilocalorie())], replyHandler: nil)
                    }
                }
                
                return .none
                
            case .test1ButtonTapped:
                debugPrint("1")
                return .none
                
            default:
                return .none
            }
        }
    }
}
