//
//  WorkoutHome.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/23.
//

import Foundation
import ComposableArchitecture

import FeatureWorkoutInterface
import SharedDesignSystem
import SharedUtil

extension WorkoutHomeStore {
    public init() {
        let reducer: Reduce<State, Action> = .init { state, action in
            switch action {
            case .binding:
                return .none
                
            case .startButtonTapped:
                return .send(.goToWorkoutStart)
                
            case .goToWorkoutStart:
                return .none
                
            case let .workoutCategoryCell(id, action):
                switch action {
                case .tapped:
                    for (workoutCategoryID, workoutCategoryIdentifiedArray) in state.workoutCategoryCellZip {
                        if let index = workoutCategoryIdentifiedArray.index(id: id) {
                            let target = workoutCategoryIdentifiedArray[index]
                            let newTarget = WorkoutCategoryCellStore.State(id: target.id, workoutCategoryIdentifier: target.workoutCategoryIdentifier, isTapped: !target.isTapped)
                            
                            state.workoutCategoryCellZip[workoutCategoryID]?.update(newTarget, at: index)
                            
                            if !target.isTapped {
                                state.selectedWorkoutCategoryIdentifiers.append(target.workoutCategoryIdentifier)
                            } else {
                                state.selectedWorkoutCategoryIdentifiers.removeAll(where: { $0 == target.workoutCategoryIdentifier })
                            }
                            break
                        }
                    }
                    return .none
                }
            }
        }
        
        self.init(reducer: reducer)
    }
}
