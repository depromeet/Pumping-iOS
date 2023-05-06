//
//  OnboardingRootView.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/05.
//

import SwiftUI

import ComposableArchitecture

public enum OnboardingScene: Hashable {
    case root
    case nickname
    case signUp
}

public struct OnboardingRootStore: ReducerProtocol {
    public init() {}
    
    public struct State: Equatable {
        @BindingState public var path: [OnboardingScene] = []
        
        public var nickname: OnboardingNicknameStore.State?
        public var signUp: OnboardingSignUpStore.State?
        
        public init() {
            
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case tapNextButton
        
        case binding(BindingAction<State>)
        case nickname(OnboardingNicknameStore.Action)
        case signUp(OnboardingSignUpStore.Action)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .tapNextButton:
                state.path.append(.nickname)
                state.nickname = .init()
                return .none
                
            case .binding:
                return .none
                
            case let .nickname(action):
                switch action {
                case .tapNextButton:
                    state.path.append(.signUp)
                    state.signUp = .init()
                }
                return .none
                
            case .signUp:
                return .none
            }
        }
    }
}

public struct OnboardingRootView {
    public let store: StoreOf<OnboardingRootStore>
    
    public init(store: StoreOf<OnboardingRootStore>) {
        self.store = store
    }
}