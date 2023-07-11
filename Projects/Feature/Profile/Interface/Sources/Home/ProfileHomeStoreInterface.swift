//
//  ProfileStoreInterface.swift
//  FeatureProfileInterface
//
//  Created by Derrick kim on 2023/06/18.
//

import SwiftUI

import ComposableArchitecture

import Domain
import Shared

public struct ProfileHomeStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>

    public init(reducer: Reduce<State, Action>) {
        self.reducer = reducer
    }
    
    public enum ProfileHomeType {
        case my, other
    }
    
    public enum WorkoutSummaryType {
        case time(Int)
        case heartRate(Int)
        case calorie(Int)
        case part(WorkoutPart, Int)
        
        var icon: Image {
            switch self {
            case .time: return PumpingImages.iconTimer.swiftUIImage
            case .heartRate: return PumpingImages.iconHeartRate.swiftUIImage
            case .calorie: return PumpingImages.iconFire.swiftUIImage
            case .part: return PumpingImages.iconTimer.swiftUIImage
            }
        }
        
        var title: String {
            switch self {
            case .time: return "누적 운동 시간"
            case .heartRate: return "평균 심박수"
            case .calorie: return "칼로리"
            case .part: return "최대 운동 부위"
            }
        }
        
        var value: String {
            switch self {
            case let .time(v): return DateManager.toClockString(from: v)
            case let .heartRate(v): return String(describing: v)
            case let .calorie(v): return String(describing: v)
            case let .part(id, _): return String(describing: "\(id.title)")
            }
        }
        
        var prefix: String {
            switch self {
            case .time: return ""
            case .heartRate: return "bpm"
            case .calorie: return "kcal"
            case let .part(_, v): return String(describing: "/\(v)분")
            }
        }
        
        var color: Color {
            switch self {
            case .time: return PumpingColors.colorCyan500.swiftUIColor
            case .heartRate: return PumpingColors.colorTeal300.swiftUIColor
            case .calorie: return PumpingColors.colorGreen600.swiftUIColor
            case .part: return PumpingColors.colorBlue400.swiftUIColor
            }
        }
    }

    public struct State: Equatable {
        public let userId: String?
        public let type: ProfileHomeType
        
        public var selectedDay: Int = 0

        public init(userId: String?, type: ProfileHomeType) {
            self.userId = userId
            self.type = type
        }
    }

    public enum Action: BindableAction, Equatable {
        case tapMyButton
        case tapWidthOfChangeButton
        case tapDayButton(Int)

        case binding(BindingAction<State>)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        
        reducer
    }
}
