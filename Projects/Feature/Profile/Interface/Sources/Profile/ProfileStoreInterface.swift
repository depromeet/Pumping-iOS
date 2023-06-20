//
//  ProfileStoreInterface.swift
//  FeatureProfileInterface
//
//  Created by Derrick kim on 2023/06/18.
//

import ComposableArchitecture
import SharedDesignSystem

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
