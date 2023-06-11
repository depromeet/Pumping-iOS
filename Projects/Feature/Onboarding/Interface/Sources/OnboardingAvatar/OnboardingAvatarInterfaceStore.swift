//
//  OnboardingCrewStore.swift
//  FeatureOnboardingInterface
//
//  Created by 박현우 on 2023/06/02.
//

import ComposableArchitecture

public struct OnboardingAvatarStore : ReducerProtocol {
    private let reducer: Reduce<State, Action>
    
    public init(reducer: Reduce<State, Action>) {
        self.reducer = reducer
    }
    
    public struct State: Equatable {
        public var isAvatarPicked : Bool = false
        public init() {}
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        case moveToNextStep
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
    }
}
