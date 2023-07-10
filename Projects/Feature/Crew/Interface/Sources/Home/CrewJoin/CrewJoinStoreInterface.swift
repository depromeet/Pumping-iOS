//
//  CrewJoinStoreInterface.swift
//  FeatureCrewInterface
//
//  Created by 박현우 on 2023/06/27.
//

import ComposableArchitecture
import Domain

public struct CrewJoinStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>

    public init(
        reducer: Reduce<State, Action>
    ) {
        self.reducer = reducer
    }

    public struct State: Equatable {
        
        @BindingState public var showCrewJoinError: Bool = false
        @BindingState public var code: String = ""
        public var isSatisfied: Bool = false
        
        public init() {

        }
    }

    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case dismissCrewJoinView
        case joinCrew
        case joinCrewResponse(TaskResult<CrewDetail>)
        case isCrewJoinCompleted
        
    }

    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
    }
}
