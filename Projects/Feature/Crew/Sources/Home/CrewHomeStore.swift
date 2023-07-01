//
//  CrewHomeStore.swift
//  FeatureCrew
//
//  Created by Derrick kim on 2023/06/13.
//

import ComposableArchitecture
import FeatureCrewInterface
import SharedDesignSystem

extension CrewHomeStore {
    public init() {
        let reducer: Reduce<State, Action> = .init { state, action in
            switch action {
            case .binding:
                return .none

            case let .profileBodyCell(id, action):
                return .none

            case let .personalRecordCell(id, action):
                return .none
                
            case .getCrewInfo:
                // initialLoad, refresh시 가져올 크루정보
                return .none
                
            case .presentCrewListView:
                state.showCrewListView = true
                return .none
                
            case .presentCrewJoinView:
                state.crewJoin = .init()
                state.showCrewJoinView = true
                return .none

            case .presentCrewMakeView:
                state.crewMake = .init()
                state.showCrewMakeView = true
                return .none
                
            case .crewJoin(.dismissCrewJoinView):
                state.crewJoin = nil
                state.showCrewJoinView = false
                return .none
                
            case .crewMake(.dismissCrewMakeView):
                state.crewMake = nil
                state.showCrewMakeView = false
                return .none
                
            case .crewJoin(.isCrewJoinCompleted):
                // 크루에 성공적으로 합류했을때 리스트를 reload
                return .none
                
            case .crewMake(.isCrewMakeCompleted):
                // 크루를 성공적으로 만들었을때 리스트를 reload
                return .none
                
            default:
                return .none
            }
        }
        
        self.init(
            reducer: reducer,
            crewJoinStore: CrewJoinStore(),
            crewMakeStore: CrewMakeStore()
        )
    }
}
