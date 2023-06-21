//
//  ProfileStore.swift
//  FeatureProfileInterface
//
//  Created by Derrick kim on 2023/06/18.
//

import ComposableArchitecture
import FeatureProfileInterface

extension ProfileStore {
    public init() {
        let reducer : Reduce<State, Action> = Reduce { state, action in
            switch action {
            case .binding:
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
