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
        public var pumpingTimerData: PumpingTimerData = .init(timers: [], updatedTime: Date().timeIntervalSince1970)
        public var pumpingTimers: [PumpingTimer] = []
        public var timerCells: IdentifiedArrayOf<TimerCellStore.State> = []
        
        public var heartRate: Int = 0
        public var calorie: Int = 0
        
        public init() { }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case setPumpingTimerData(PumpingTimerData)
        case setPumpingTimers([PumpingTimer])
        case setHeartRate(Int)
        case setCalorie(Int)
        
        case sinkPumpingTimerData(PumpingTimerData)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
                
            case let .setPumpingTimerData(pumpingTimerData):
                state.pumpingTimerData = pumpingTimerData
                return .send(.sinkPumpingTimerData(pumpingTimerData))
                
            case let .setPumpingTimers(pumpingTimers):
                state.pumpingTimers = pumpingTimers
                return .none
                
            case let .setHeartRate(heartRate):
                state.heartRate = heartRate
                return .none
                
            case let .setCalorie(calorie):
                state.calorie = calorie
                return .none
                
            case let .sinkPumpingTimerData(pumpingTimerData):
                if state.pumpingTimerData.updatedTime < pumpingTimerData.updatedTime + 1000 || state.pumpingTimerData.isHardPush {
                    state.pumpingTimerData = pumpingTimerData
                    return .send(.setPumpingTimers(pumpingTimerData.timers))
                }
                return .none
            }
        }
    }
}
