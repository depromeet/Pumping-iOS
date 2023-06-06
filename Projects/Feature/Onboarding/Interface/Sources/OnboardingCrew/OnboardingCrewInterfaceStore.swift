//
//  OnboardingCrewStore.swift
//  FeatureOnboardingInterface
//
//  Created by 박현우 on 2023/06/02.
//

import ComposableArchitecture

public struct OnboardingCrewStore : ReducerProtocol {
    private let reducer: Reduce<State, Action>
    private let onboardingCrewJoinStore : OnboardingCrewJoinStore
    
    public init(reducer: Reduce<State, Action>, onboardingCrewJoinStore : OnboardingCrewJoinStore) {
        self.reducer = reducer
        self.onboardingCrewJoinStore = onboardingCrewJoinStore
    }
    
    public struct State: Equatable {
        @BindingState public var showCrewJoin : Bool = false
        public var crewJoin : OnboardingCrewJoinStore.State?
        public init() {}
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        case crewJoinButtonTapped
        case crewJoin(OnboardingCrewJoinStore.Action)
        case moveToNextStep
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
            .ifLet(\.crewJoin, action: /Action.crewJoin) {
                onboardingCrewJoinStore
            }
    }
}
