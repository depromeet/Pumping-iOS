//
//  CrewHomeStore.swift
//  FeatureCrew
//
//  Created by Derrick kim on 2023/06/13.
//

import ComposableArchitecture
import FeatureCrewInterface
import SharedDesignSystem

extension CrewHomeStore {
    public init() {
        let reducer: Reduce<State, Action> = .init { state, action in
            switch action {
            case .binding:
                return .none

            case let .profileBodyCell(id, action):
                return .none

            case let .personalRecordCell(id, action):
                return .none

            default:
                return .none
            }
        }
        
        self.init(
            reducer: reducer
        )
    }
}
