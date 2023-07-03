//
//  CrewRootStore.swift
//  FeatureCrew
//
//  Created by Derrick kim on 2023/06/13.
//

import ComposableArchitecture

import FeatureCrewInterface
import FeatureProfileInterface

extension CrewRootStore {
    public init(
        profileStore: ProfileStore,
        widthOfChangeStore: WidthOfChangeStore
    ) {
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

                case .goToCrewRankingView:
                    state.path.append(.crewRanking)
                    state.crewRanking = .init()
                    return .none

                default:
                    return .none
                }

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
            crewHomeStore: .init(),
            crewRankingStore: .init(),
            profileStore: profileStore,
            widthOfChangeStore: widthOfChangeStore,
            profileStore: .init()
        )
    }
}
