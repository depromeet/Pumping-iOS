//
//  OnboardingRootStore.swift
//  FeatureOnboarding
//
//  Created by 송영모 on 2023/05/11.
//

import Foundation

import ComposableArchitecture
import FeatureOnboardingInterface
import CoreKeyChainStore

extension OnboardingRootStore {
    public init() {
        
        @Dependency(\.authClient) var authClient
        
        let reducer: Reduce<State, Action> = Reduce { state, action in
            switch action {
            case .auth(.moveToNextStep):
                state.path.append(.permission)
                state.permission = .init()
                return .none
                
            case .permission(.moveToNextStep):
                state.path.append(.profile)
                state.profile = .init()
                return .none
                
            case .profile(.moveToNextStep):
                state.path.append(.avatar)
                state.avatar = .init()
                return .none
                
            default :
                return .none
            }
        }
        
        self.init(
            reducer: reducer,
            onboardingAuthStore: OnboardingAuthStore(),
            onboardingPermissionStore: OnboardingPermissionStore(),
            onboadingProfileStore: OnboadingProfileStore(),
            onboardingAvatarStore: OnboardingAvatarStore()
        )
    }
}
