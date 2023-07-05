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

public struct HomeStore: ReducerProtocol {
    
    public init() {}
    
    public enum ResultType {
        case time, heatRate, calorie
        
        public var title: String {
            switch self {
            case .time: return "총 시간"
            case .heatRate: return "심박수"
            case .calorie: return "총 칼로리"
            }
        }
        
        public var image: Image {
            switch self {
            case .time: return PumpingImages.iconTimer.swiftUIImage
            case .heatRate: return PumpingImages.iconHeartbeat.swiftUIImage
            case .calorie: return PumpingImages.iconFire.swiftUIImage
            }
        }
        
        public func toSyntax(value: Double) -> String {
            switch self {
            case .time:
                return DateManager.toClockString(from: Int(value))
                
            case .heatRate:
                if value == 0 {
                    return "-"
                } else {
                    return String(describing: "\(Int(value))bpm")
                }
                
            case .calorie:
                if value == 0 {
                    return "-"
                } else {
                    return String(describing: "\(Int(value))Kcal")
                }
            }
        }
    
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
