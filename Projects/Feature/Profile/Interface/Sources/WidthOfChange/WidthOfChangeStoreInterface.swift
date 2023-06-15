//
//  WidthOfChangeStoreInterface.swift
//  FeatureProfileInterface
//
//  Created by Derrick kim on 2023/06/06.
//

import ComposableArchitecture
import SharedDesignSystem

public struct WidthOfChangeStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>

    public init(reducer: Reduce<State, Action>) {
        self.reducer = reducer
    }

    public struct State: Equatable {
        public var widthOfChangeList: IdentifiedArrayOf<WidthOfChangeCellStore.State> = [
            .init(id: .init(), title: .workoutTime, previousData: "3시간", currentData: "5시간"),
            .init(id: .init(), title: .calorie, previousData: "100kcal", currentData: "330kcal"),
            .init(id: .init(), title: .averageHeartRate, previousData: "2시간 / 100bpm", currentData: "120bpm", currentTime: "평균 5시간 /"),
            .init(id: .init(), title: .maxWorkoutPart, previousData: "2시간 / 하체", currentData: "상체", currentTime: "5시간 /")
        ]

        public init() {

        }
    }

    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)

        case widthOfChangeCell(id: WidthOfChangeCellStore.State.ID, action: WidthOfChangeCellStore.Action)
    }

    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
    }
}
