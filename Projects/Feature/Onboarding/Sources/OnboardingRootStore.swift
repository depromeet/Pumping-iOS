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
        
        self.init(reduce: reduce)
    }
}
