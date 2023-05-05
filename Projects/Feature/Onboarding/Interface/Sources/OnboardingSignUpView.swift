//
//  OnboardingSignUpView.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/05.
//

import Foundation

import ComposableArchitecture

public struct OnboardingSignUp: ReducerProtocol {
    public init() {}
    
    public struct State: Equatable {
        public var navigation: OnboardingNavigation.State
        
        public init(navigation: OnboardingNavigation.State) {
            self.navigation = navigation
        }
    }
    
    public enum Action: Equatable {
        case navigation(OnboardingNavigation.Action)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        Scope(state: \.navigation, action: /Action.navigation) {
            OnboardingNavigation()
        }
        
        Reduce { state, action in
            return .none
        }
    }
}

public struct OnboardingSignUpView {
    public let store: StoreOf<OnboardingSignUp>
    
    public init(store: StoreOf<OnboardingSignUp>) {
        self.store = store
    }
}
