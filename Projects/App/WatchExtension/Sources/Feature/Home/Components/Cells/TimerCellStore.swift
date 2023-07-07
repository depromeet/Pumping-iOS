//
//  TimerCellStore.swift
//  Pumping
//
//  Created by 송영모 on 2023/07/05.
//

import SwiftUI

import ComposableArchitecture

import WatchSharedDesignSystem
import WatchSharedUtil

public struct TimerCellStore: ReducerProtocol {
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
    }
    
    public struct State: Equatable, Identifiable {
        public let id: UUID
        public let timer: PumpingTimer

        public init(id: UUID, timer: PumpingTimer) {
            self.id = id
            self.timer = timer
        }
    }

    public enum Action: Equatable {
        case tapped
    }

    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .tapped:
            return .none
        }
    }
}
