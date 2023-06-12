//
//  OnboardingCrewStore.swift
//  FeatureOnboardingInterface
//
//  Created by 박현우 on 2023/06/01.
//

import Foundation
import ComposableArchitecture
import FeatureOnboardingInterface

extension OnboardingAvatarStore {
    public init() {
        let reducer : Reduce<State, Action> = Reduce { state, action in
            switch action {
            default:
                return .none
            }
        }
        
        self.init(
            reducer: reducer
        )
    }
}
