//
//  CrewMakeStoreInterface.swift
//  FeatureCrewInterface
//
//  Created by 박현우 on 2023/06/27.
//

import ComposableArchitecture

public struct CrewMakeStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>

    public init(
        reducer: Reduce<State, Action>
    ) {
        self.reducer = reducer
    }

    public struct State: Equatable {
        
        @BindingState public var showCrewMakeCompleteView: Bool = false
        @BindingState public var crewName: String = ""
        @BindingState public var goalCount: Int = 1
        public var isSatisfied: Bool = false
        
        public init() {

        }
    }

    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)

        case dismissCrewMakeView
        case goToCrewMakeCompleteView
        case addGoalCount
        case subGoalCount
        case copyCode
        case isCrewMakeCompleted
        
    }

    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
    }
}
