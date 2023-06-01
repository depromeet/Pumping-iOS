//
//  OnboardingRootStoreInterface.swift
//  FeatureOnboardingRootStoreInterface
//
//  Created by 송영모 on 2023/05/05.
//

import ComposableArchitecture

public struct OnboardingRootStore: ReducerProtocol {
    private let reduce: Reduce<State, Action>
    private let onboardingAuthStore: OnboardingAuthStore
    private let onboardingProfileStore: OnboadingProfileStore
    
    public init(
        reduce: Reduce<State, Action>,
        onboardingAuthStore: OnboardingAuthStore,
        onboadingProfileStore: OnboadingProfileStore
    ) {
        self.reduce = reduce
        self.onboardingAuthStore = onboardingAuthStore
        self.onboardingProfileStore = onboadingProfileStore
    }
    
    public struct State: Equatable {
        @BindingState public var path: [OnboardingScene] = []
        
        public var auth: OnboardingAuthStore.State?
        public var profile: OnboadingProfileStore.State?
        
        public init() {
            
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        case auth(OnboardingAuthStore.Action)
        case profile(OnboadingProfileStore.Action)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reduce
            .ifLet(\.auth, action: /Action.auth) {
                onboardingAuthStore
            }
            .ifLet(\.profile, action: /Action.profile) {
                onboardingProfileStore
            }
    }
}
