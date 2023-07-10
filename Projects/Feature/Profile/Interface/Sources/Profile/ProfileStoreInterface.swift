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

public enum ProfileSubject: Hashable {
    case my
    case other
}

public struct ProfileStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>

    public init(
        reducer: Reduce<State, Action>
    ) {
        self.reducer = reducer
    }
    
    public enum WorkoutSummaryType {
        case time(Int)
        case heartRate(Int)
        case calorie(Int)
        case part(WorkoutCategoryIdentifier, Int)
        
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
        @BindingState public var path: [ProfileScene] = []

        public var hasComparison: Bool = false
        public var profileWeekDayList: IdentifiedArrayOf<ProfileWeekDayCellStore.State> = [
            .init(id: .init(), index: 0, weekDay: "월"),
            .init(id: .init(), index: 1, weekDay: "화"),
            .init(id: .init(), index: 2, weekDay: "수"),
            .init(id: .init(), index: 3, weekDay: "목"),
            .init(id: .init(), index: 4, weekDay: "금"),
            .init(id: .init(), index: 5, weekDay: "토"),
            .init(id: .init(), index: 6, weekDay: "일")
        ]

        public init() { }
    }

    public enum Action: BindableAction, Equatable {
        case tapHeartButton
        case tapWidthOfChangeButton
        case tapComparisonButton(Bool)

        case binding(BindingAction<State>)
        case profileWeekDayCell(id: ProfileWeekDayCellStore.State.ID,
                                action: ProfileWeekDayCellStore.Action)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
    }
}
