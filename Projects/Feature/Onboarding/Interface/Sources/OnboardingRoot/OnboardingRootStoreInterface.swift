//
//  OnboardingRootStoreInterface.swift
//  FeatureOnboardingRootStoreInterface
//
//  Created by 송영모 on 2023/05/05.
//

import ComposableArchitecture

public struct OnboardingRootStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>
    private let onboardingAuthStore: OnboardingAuthStore
    private let onboardingPermissionStore: OnboardingPermissionStore
    private let onboardingProfileStore: OnboadingProfileStore
    private let onboardingAvatarStore: OnboardingAvatarStore
    
    public init(
        reducer: Reduce<State, Action>,
        onboardingAuthStore: OnboardingAuthStore,
        onboardingPermissionStore: OnboardingPermissionStore,
        onboadingProfileStore: OnboadingProfileStore,
        onboardingAvatarStore: OnboardingAvatarStore
    ) {
        self.reducer = reducer
        self.onboardingAuthStore = onboardingAuthStore
        self.onboardingPermissionStore = onboardingPermissionStore
        self.onboardingProfileStore = onboadingProfileStore
        self.onboardingAvatarStore = onboardingAvatarStore
    }

    public struct State:  Equatable {
        @BindingState public var path: [OnboardingScene] = []
        
        public var auth: OnboardingAuthStore.State = .init()
        public var permission: OnboardingPermissionStore.State?
        public var profile: OnboadingProfileStore.State?
        public var avatar: OnboardingAvatarStore.State?
        
        public init() { }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case auth(OnboardingAuthStore.Action)
        case permission(OnboardingPermissionStore.Action)
        case profile(OnboadingProfileStore.Action)
        case avatar(OnboardingAvatarStore.Action)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        
        Scope(state: \.auth, action: /Action.auth) {
            onboardingAuthStore
        }
        
        reducer
            .ifLet(\.permission, action: /Action.permission) {
                onboardingPermissionStore
            }
            .ifLet(\.profile, action: /Action.profile) {
                onboardingProfileStore
            }
            .ifLet(\.avatar, action: /Action.avatar) {
                onboardingAvatarStore
            }
    }
}
