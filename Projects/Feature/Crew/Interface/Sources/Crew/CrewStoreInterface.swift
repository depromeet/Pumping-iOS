//
//  CrewStoreInterface.swift
//  FeatureCrewInterface
//
//  Created by Derrick kim on 2023/06/15.
//

import ComposableArchitecture

public struct CrewStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>

    public init(reducer: Reduce<State, Action>) {
        self.reducer = reducer
    }

    public struct State: Equatable {
        public init() {

        }
    }

    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        case crewViewDidDisappear
    }

    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
    }
}
