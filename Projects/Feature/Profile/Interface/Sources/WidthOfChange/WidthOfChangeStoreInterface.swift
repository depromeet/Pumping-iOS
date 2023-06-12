//
//  WidthOfChangeStoreInterface.swift
//  FeatureProfileInterface
//
//  Created by Derrick kim on 2023/06/06.
//

import ComposableArchitecture

public struct WidthOfChangeStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>

    public init(reducer: Reduce<State, Action>) {
        self.reducer = reducer
    }

    public struct State: Equatable {
        public init() {

        }
    }

    public enum Action: Equatable {

    }

    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {

    }
}
