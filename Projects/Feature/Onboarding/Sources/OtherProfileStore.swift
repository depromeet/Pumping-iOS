//
//  OtherProfileStore.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/11.
//

import ComposableArchitecture

import FeatureOnboardingInterface

extension OtherProfileStore {
    public init() {
        let reduce: Reduce<State, Action> = .init { state, action in
            return .none
        }
        
        self.init(reduce: reduce)
    }
}
