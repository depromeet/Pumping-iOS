//
//  CrewHomeStore.swift
//  FeatureCrew
//
//  Created by Derrick kim on 2023/06/13.
//

import UIKit
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
                
            case .presentCrewListView:
                state.showCrewListView = true
                return .none
              
            // CrewJoin
            case .presentCrewJoinView:
                state.showCrewJoinView = true
                return .none
                
            case .dismissCrewJoinView:
                state.code = ""
                state.showCrewJoinDetailView = false
                state.showCrewJoinView = false
                return .none
                
            case .goToCrewJoinDetailView:
                state.showCrewJoinDetailView = true
                return .none
                
            // CrewMake
            case .presentCrewMakeView:
                state.showCrewMakeView = true
                return .none

            case .goToCrewMakeCompleteView:
                state.showCrewMakeCompleteView = true
                return .none
                
            case .dismissCrewMakeView:
                state.crewName = ""
                state.goalCount = 0
                state.showCrewMakeView = false
                state.showCrewMakeCompleteView = false
                return .none
                
            case .addGoalCount:
                guard state.goalCount < 7 else {
                    return .none
                }
                
                state.goalCount += 1
                return .none
                
            case .subGoalCount:
                guard state.goalCount != 1 else {
                    return .none
                }
                
                state.goalCount -= 1
                return .none
                
            case .copyCode:
                UIPasteboard.general.string = "복사한 값"
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
