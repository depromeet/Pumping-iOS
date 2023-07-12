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
        profileHomeStore: ProfileHomeStore,
        profileWidthOfChangeStore: ProfileWidthOfChangeStore
    ) {
        let reducer: Reduce<State, Action> = .init { state, action in
            switch action {
            case .binding:
                return .none
                
            case let .crewHome(action):
                switch action {
                case .goToProfileView:
                    state.path.append(.profile)
                    state.profileHome = .init(userId: "", type: .other)//TODO: other이 아닌경우 체크 해야함
                    return .none
                
                //TODO: 머지 컨플릭트 해결후 버그
//                case .goToCrewRankingView:
//                    state.path.append(.crewRanking)
//                    state.crewRanking = .init()
//                    return .none

                default:
                    return .none
                }

            case .profileHome(.tapWidthOfChangeButton):
                state.path.append(.widthOfChange)
                state.profileWidthOfChange = .init()
                return .none

            default:
                return .none
            }
        }
        
        self.init(
            reducer: reducer,
            profileHomeStore: profileHomeStore,
            profileWidthOfChangeStore: profileWidthOfChangeStore,
            crewHomeStore: .init(),
            crewRankingStore: .init()
        )
    }
}
