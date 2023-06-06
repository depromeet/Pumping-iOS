//
//  OnboardingCrewJoinStore.swift
//  FeatureOnboardingInterface
//
//  Created by 박현우 on 2023/06/04.
//

import Foundation
import ComposableArchitecture

public struct OnboardingCrewJoinStore : ReducerProtocol {
    
    private let reducer: Reduce<State, Action>
    
    public init(reducer: Reduce<State, Action>) {
        self.reducer = reducer
    }
    
    public struct State: Equatable {
        @BindingState public var code: String = ""
        public init() {}
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        case crewJoinViewDidDisappear
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
    }
    
}
