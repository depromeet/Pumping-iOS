//
//  OnboardingCrewJoinStore.swift
//  FeatureOnboardingInterface
//
//  Created by 박현우 on 2023/06/04.
//

import Foundation
import ComposableArchitecture
import FeatureOnboardingInterface

extension OnboardingCrewJoinStore {
    public init() {
        let reducer: Reduce<State, Action> = Reduce { state, action in
            switch action {
            case .crewJoinViewDidDisappear:
                return .none
            case .binding:
                return .none
            }
        }
        
        self.init(reducer: reducer)
    }
}
