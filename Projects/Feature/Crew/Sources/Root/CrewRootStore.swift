//
//  CrewRootStore.swift
//  FeatureCrew
//
//  Created by Derrick kim on 2023/06/13.
//

import ComposableArchitecture
import FeatureCrewInterface
import FeatureProfile

extension CrewRootStore {
    public init() {
        let reducer: Reduce<State, Action> = .init { state, action in
            switch action {
            case .binding:
                return .none
                
            case let .crewHome(action):
                switch action {
                case .goToProfileView:
                    state.path.append(.profile)
                    state.profile = .init()
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
            crewHomeStore: .init(),
            crewRankingStore: .init(),
            profileStore: .init()
        )
    }
}
