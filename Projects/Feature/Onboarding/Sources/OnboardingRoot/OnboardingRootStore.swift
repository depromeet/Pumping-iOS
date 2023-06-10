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
        let reducer: Reduce<State, Action> = Reduce { state, action in
            switch action {
            case .binding:
                return .none
                
            case .moveToAuth :
                state.auth = .init(.init(index: 0))
                state.path.append(.auth)
                return .none
                
            case let .auth(action):
                switch action {
                case .moveToNextStep :
                    state.permission = .init()
                    state.path.append(.permission)
                default :
                    return .none
                }
                return .none
                
            case let .permission(action):
                switch action {
                case .moveToNextStep :
                    state.profile = .init()
                    state.path.append(.profile)
                default :
                    return .none
                }
                return .none
                
            case let .profile(action):
                switch action {
                case .moveToNextStep :
                    state.crew = .init()
                    state.path.append(.crew)
                default :
                    return .none
                }
                return .none
                
            case let .crew(action):
                switch action {
                case .moveToNextStep :
                    return .none
                default :
                    return .none
                }
            }
        }
        
        self.init(
            reducer: reducer,
            onboardingAuthStore: OnboardingAuthStore(),
            onboardingPermissionStore: OnboardingPermissionStore(),
            onboadingProfileStore: OnboadingProfileStore(),
            onboardingCrewStore: OnboardingCrewStore()
        )
    }
}
