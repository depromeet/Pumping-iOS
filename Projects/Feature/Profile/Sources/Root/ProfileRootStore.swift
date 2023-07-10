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

            case let .home(action):
                switch action {
                case .tapWidthOfChangeButton:
                    state.widthOfChange = .init()
                    state.path.append(.widthOfChange)
                    return .none
                    
                default:
                    return .none
                }

            default:
                return .none
            }
        }

        self.init(
            reducer: reducer,
            profileHomeStore: .init(),
            profileWidthOfChangeStore: .init()
        )
    }
}
