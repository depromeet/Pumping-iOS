//
//  CrewRankingStoreInterface.swift
//  FeatureCrewInterface
//
//  Created by Derrick kim on 2023/06/15.
//

import ComposableArchitecture
import SharedDesignSystem

public struct CrewRankingStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>

    public init(
        reducer: Reduce<State, Action>
    ) {
        self.reducer = reducer
    }

    public struct State: Equatable {
        public var crewRankingList: IdentifiedArrayOf<CrewRankingCellStore.State> = [
            .init(id: .init(), title: "상체 머신", ranking: "1", userName: "채령", data: ["상체 6시간", "상체 839kcal"]),
            .init(id: .init(), title: "운동 누적 시간", ranking: "1", userName: "채령", data: ["07:43:29"]),
            .init(id: .init(), title: "꼴찌의 전당", ranking: "1", userName: "채령", data: ["30분", "839kcal"]),
            .init(id: .init(), title: "하체 머신", ranking: "1", userName: "채령", data: ["하체 2시간 3분", " 839kcal"]),
            .init(id: .init(), title: "유산소킹", ranking: "1", userName: "채령", data: ["유산소 2시간 3분", " 839kcal"])
        ]

        public init() {

        }
    }

    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)

        case crewRankingCell(id: CrewRankingCellStore.State.ID, action: CrewRankingCellStore.Action)
    }

    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
    }
}
