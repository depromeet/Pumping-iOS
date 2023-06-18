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

            case .tapHeartButton:
                return .none

            case .tapWidthOfChangeButton:
                state.path = [.widthOfChange]
                state.widthOfChange = .init()
                return .none

            case let .tapComparisonButton(isEnabled):
                state.hasComparison = isEnabled
                return .none

            case let .profileWeekDayCell(id, action):
                return .none

            case let .widthOfChange(action):
                return .none
            }
        }

        self.init(
            reducer: reducer,
            widthOfChangeStore: WidthOfChangeStore()
        )
    }
}
