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
    
    public enum State: Equatable {
        case auth(OnboardingAuthStore.State)
        case permission(OnboardingPermissionStore.State)
        case profile(OnboadingProfileStore.State)
        case avatar(OnboardingAvatarStore.State)
        
        public init() {
            self = .auth(.init())
        }
    }
    
    public enum Action: Equatable {
        case auth(OnboardingAuthStore.Action)
        case permission(OnboardingPermissionStore.Action)
        case profile(OnboadingProfileStore.Action)
        case avatar(OnboardingAvatarStore.Action)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        reducer
            .ifCaseLet(/State.auth, action: /Action.auth) {
                onboardingAuthStore
            }
            .ifCaseLet(/State.permission, action: /Action.permission) {
                onboardingPermissionStore
            }
            .ifCaseLet(/State.profile, action: /Action.profile) {
                onboardingProfileStore
            }
            .ifCaseLet(/State.avatar, action: /Action.avatar) {
                onboardingAvatarStore
            }
    }
}
