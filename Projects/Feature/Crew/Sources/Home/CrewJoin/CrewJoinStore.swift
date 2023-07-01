//
//  CrewJoinStore.swift
//  FeatureCrewInterface
//
//  Created by 박현우 on 2023/06/27.
//

import ComposableArchitecture
import FeatureCrewInterface

extension CrewJoinStore {
    public init() {
        let reducer: Reduce<State, Action> = .init { state, action in
            switch action {
            case .binding:
                if state.code.count > 0 && state.code.count < 16 {
                    state.isSatisfied = true
                } else {
                    state.isSatisfied = false
                }
                
                return .none
                
            case .dismissCrewJoinView:
                state.code = ""
                return .none

            case .crewJoinButtonTapped:
                // 크루 참여 API
                return .send(.dismissCrewJoinView)
                
            default:
                return .none
            }
        }
        
        self.init(
            reducer: reducer
        )
    }
}
