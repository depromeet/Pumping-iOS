//
//  ProfileRootStore.swift
//  FeatureMyPageInterface
//
//  Created by Derrick kim on 2023/06/06.
//

import Foundation
import ComposableArchitecture
import FeatureProfileInterface

extension ProfileRootStore {
    public init() {
        let reducer : Reduce<State, Action> = Reduce { state, action in
            switch action {
            case .binding:
                return .none

            case .profile(.tapWidthOfChangeButton):
                state.path.append(.widthOfChange)
                state.widthOfChange = .init()
                return .none

            default:
                return .none
            }
        }

        self.init(
            reducer: reducer,
            profileStore: .init(),
            widthOfChangeStore: .init()
        )
    }
}
