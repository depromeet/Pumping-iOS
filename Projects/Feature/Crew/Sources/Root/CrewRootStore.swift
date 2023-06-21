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

                case .goToCrewRankingView:
                    state.path.append(.crewRanking)
                    state.crewRanking = .init()
                    return .none

                case .presentCrewScreen:
                    state.showingCrew = true
                    state.crew = .init()
                    return .none

                default:
                    return .none
                }

            case let .crew(action):
                switch action {
                case .crewViewDidDisappear:
                    state.showingCrew = false
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
            crewStore: .init(),
            crewRankingStore: .init(),
            profileStore: .init(),
            widthOfChangeStore: .init()
        )
    }
}
