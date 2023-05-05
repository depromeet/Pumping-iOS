//
//  OnboardingRootView.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/05.
//

import Foundation

import ComposableArchitecture

public enum OnboardingDestination: Equatable {
    case nickname
    case signUp
}

public struct OnboardingRoot: ReducerProtocol {
    public init() {}
    
    public struct State: Equatable {
        @BindingState public var path: [OnboardingDestination] = []
        
        public init() {
            
        }
    }
    
    public enum Action: Equatable {
        case goToNickname
        case navigationPathChanged([OnboardingDestination])
    }
    
    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .goToNickname:
            state.path.append(.nickname)
            return .none
            
        case let .navigationPathChanged(path):
            state.path = path
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
