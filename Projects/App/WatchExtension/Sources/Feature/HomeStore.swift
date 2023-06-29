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
        public var heartRate: Int = 0
        public var calorie: Int = 0
        
        public init() { }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case setHeartRate(Int)
        case setCalorie(Int)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
                
            case let .setHeartRate(heartRate):
                state.heartRate = heartRate
                return .none
                
            case let .setCalorie(calorie):
                state.calorie = calorie
                return .none
            }
        }
    }
}
