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
        let reduce: Reduce<State, Action> = .init { state, action in
            switch action {
            case .binding:
                return .none
                
            case .tapNicknameButton:
                state.path.append(.nickname)
                state.nickname = .init()
                return .none
                
            case .tapOtherProfileButton:
                state.path.append(.otherProfile)
                state.otherProfile = .init()
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
                
            case let .otherProfile(action):
                switch action {
                case let .goToOtherProfileDetail(otherProfileDetailState):
                    state.path.append(.otherProfileDetail)
                    state.otherProfileDetail = otherProfileDetailState
                    return .none
                    
                default:
                    return .none
                }
                
            case .otherProfileDetail:
                return .none
            }
        }
        
        self.init(
            reduce: reduce,
            onboardingNicknameStore: .init(),
            onboardingSignUpStore: .init(),
            otherProfileStore: .init(),
            otherProfileDetailStore: .init()
        )
    }
}