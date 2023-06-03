//
//  OnboardingCrewStore.swift
//  FeatureOnboardingInterface
//
//  Created by 박현우 on 2023/06/02.
//

import ComposableArchitecture

public struct OnboardingCrewStore : ReducerProtocol {
    private let reducer: Reduce<State, Action>
    
    public init(reducer: Reduce<State, Action>) {
        self.reducer = reducer
    }
    
    public struct State: Equatable {
        init() {}
    }
    
    public enum Action: Equatable {
        case moveToNextStep
    }
    
    public var body: some ReducerProtocol<State, Action> {
        reducer
    }
}
