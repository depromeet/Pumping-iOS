//
//  CrewMakeStore.swift
//  FeatureCrewInterface
//
//  Created by 박현우 on 2023/06/27.
//

import ComposableArchitecture
import FeatureCrewInterface
import UIKit

extension CrewMakeStore {
    public init() {
        let reducer: Reduce<State, Action> = .init { state, action in
            switch action {
            case .binding:
                if state.crewName.count > 0 && state.crewName.count < 16 {
                    state.isSatisfied = true
                } else {
                    state.isSatisfied = false
                }
                return .none
                
            case .goToCrewMakeCompleteView:
                state.showCrewMakeCompleteView = true
                return .none
                
            case .dismissCrewMakeView:
                state.crewName = ""
                state.goalCount = 0
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
