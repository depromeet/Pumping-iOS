//
//  OnboardingRootView.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/05.
//

import ComposableArchitecture

public enum OnboardingScene: Hashable {
    case root
    case nickname
    case signUp
}

public struct OnboardingRootStore: ReducerProtocol {
    private let reduce: Reduce<State, Action>
    
    public init(reduce: Reduce<State, Action>) {
        self.reduce = reduce
    }
    
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
        reduce
    }
}


public struct OnboardingRootView {
    public let store: StoreOf<OnboardingRootStore>
    
    public init(store: StoreOf<OnboardingRootStore>) {
        self.store = store
    }
}
