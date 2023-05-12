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
            switch action {
            case let .tapCell(index):
                return .send(.goToOtherProfileDetail(.init(index: index)))
                
            default:
                return .none
            }
        }
        
        self.init(reduce: reduce)
    }
}
