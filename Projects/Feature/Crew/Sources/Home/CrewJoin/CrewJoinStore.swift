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
                }
                return .none
                
            case .dismissCrewJoinView:
                state.code = ""
                state.showCrewJoinDetailView = false
                return .none
                
            case .goToCrewJoinDetailView:
                state.showCrewJoinDetailView = true
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
