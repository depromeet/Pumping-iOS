//
//  HomeStore.swift
//  AppWatchExtension
//
//  Created by 송영모 on 2023/06/26.
//

import SwiftUI
import HealthKit

import ComposableArchitecture

import WatchSharedDesignSystem
import WatchSharedUtil

public struct HomeStore: ReducerProtocol {
    
    public init() {}
    
    public struct State: Equatable {
        public var pumpingTimerData: PumpingTimerData = .init(timers: [], updatedTime: Date().timeIntervalSince1970)
        public var pumpingTimers: [PumpingTimer] = []
        public var timerCells: IdentifiedArrayOf<TimerCellStore.State> = []
        
        public var heartRate: Int = 0
        public var calorie: Int = 0
        
        public init() {
            timerCells.append(.init(id: .init(), timer: .init(id: .init(), workoutCategoryIdentifier: .aerobic, time: 300, heartRateSum: 300.0, heartRateCount: 10, calorie: 100.0, pinTime: 10, isActive: true)))
            timerCells.append(.init(id: .init(), timer: .init(id: .init(), workoutCategoryIdentifier: .aerobic, time: 300, heartRateSum: 300.0, heartRateCount: 10, calorie: 100.0, pinTime: 10, isActive: true)))
            timerCells.append(.init(id: .init(), timer: .init(id: .init(), workoutCategoryIdentifier: .aerobic, time: 300, heartRateSum: 300.0, heartRateCount: 10, calorie: 100.0, pinTime: 10, isActive: true)))
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case setPumpingTimerData(PumpingTimerData)
        case setPumpingTimers([PumpingTimer])
        case setHeartRate(Int)
        case setCalorie(Int)
        
        case sinkPumpingTimerData(PumpingTimerData)
        
        case timerCell(id: UUID, action: TimerCellStore.Action)
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
                
            case .timerCell:
                return .none
            }
        }
    }
}
