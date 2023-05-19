//
//  OtherProfileDetailStore.swift
//  FeatureOnboarding
//
//  Created by 송영모 on 2023/05/12.
//

import ComposableArchitecture

import FeatureOnboardingInterface

extension OtherProfileDetailStore {
    public init() {
        let reducer: Reduce<State, Action> = .init { state, action in
            switch action {
            case .binding:
                return .none
            }
        }
        
        self.init(reducer: reducer)
    }
}
