//
//  OtherProfileStore.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/11.
//

import ComposableArchitecture
import FeatureOnboardingInterface

extension OnboadingProfileStore {
    public init() {
        let reducer: Reduce<State, Action> = Reduce { state, action in
            switch action {
            case .binding:
                
                return .none
            case let .setGender(gender):
                state.gender = gender
                return .none
            case.moveToNextStep :
                return .none
            }
        }
        
        self.init(reducer: reducer)
    }
}
