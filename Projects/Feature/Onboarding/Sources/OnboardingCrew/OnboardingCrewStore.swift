//
//  OnboardingCrewStore.swift
//  FeatureOnboardingInterface
//
//  Created by 박현우 on 2023/06/01.
//

import Foundation
import ComposableArchitecture
import FeatureOnboardingInterface

extension OnboardingCrewStore {
    public init() {
        let reducer : Reduce<State, Action> = Reduce { state, action in
            switch action {
            case .binding:
                return .none
            case .moveToNextStep :
                return .none
            case .crewJoinButtonTapped:
                state.showCrewJoin = true
                state.crewJoin = .init()
                return .none
            case let .crewJoin(action):
                switch action {
                case .crewJoinViewDidDisappear:
                    state.showCrewJoin = false
                    return .none
                default :
                    return .none
                }
            }
        }
        
        self.init(
            reducer: reducer,
            onboardingCrewJoinStore: OnboardingCrewJoinStore()
        )
    }
}
