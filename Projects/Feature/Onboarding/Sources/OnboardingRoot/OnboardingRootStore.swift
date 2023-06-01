//
//  OnboardingRootStore.swift
//  FeatureOnboarding
//
//  Created by 송영모 on 2023/05/11.
//

import Foundation

import ComposableArchitecture

import FeatureOnboardingInterface

extension OnboardingRootStore {
    public init() {
        let reduce: Reduce<State, Action> = Reduce { state, action in
            switch action {
            case .binding:
                return .none
                
            case .auth:
                return .none
                
            case let .profile(action):
                return .none
            }
        }
        
        self.init(
            reduce: reduce,
            onboardingAuthStore: OnboardingAuthStore(),
            onboadingProfileStore: OnboadingProfileStore()
        )
    }
}
