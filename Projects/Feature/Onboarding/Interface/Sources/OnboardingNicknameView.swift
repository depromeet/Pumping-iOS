//
//  OnboardingNicknameView.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/05.
//

import Foundation

import ComposableArchitecture

public struct OnboardingNickname: ReducerProtocol {
    public init() {}
    
    public struct State: Equatable {
        @BindingState public var path: [OnboardingDestination]
        
        public init(path: BindingState<[OnboardingDestination]>) {
            _path = path
        }
    }
    
    public enum Action: Equatable {
        case goToSignUp
    }
    
    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .goToSignUp:
            state.path.append(.signUp)
            return .none
        }
    }
}

public struct OnboardingNicknameView {
    public let store: StoreOf<OnboardingNickname>
    
    public init(store: StoreOf<OnboardingNickname>) {
        self.store = store
    }
}
