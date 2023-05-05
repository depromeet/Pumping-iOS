//
//  OnboardingRootView.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/05.
//

import Foundation

import ComposableArchitecture

public struct OnboardingRoot: ReducerProtocol {
    public init() {}
    
    public struct State: Equatable {
        var navigation = OnboardingNavigation.State()
        
        public init() {
            
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

public struct OnboardingRootView {
    public let store: StoreOf<OnboardingRoot>
    
    public init(store: StoreOf<OnboardingRoot>) {
        self.store = store
    }
}
