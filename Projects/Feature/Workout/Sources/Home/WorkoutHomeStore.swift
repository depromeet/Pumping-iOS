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
                
            case let .pumpingTextCell(id, action):
                switch action {
                case .tapped:
                    for (key, cells) in state.workoutCategoryZip {
                        if let index = cells.index(id: id) {
                            let target = cells[index]
                            let newTarget = PumpingTextCellStore.State(id: target.id, title: target.title, isTapped: !target.isTapped)
                            
                            state.workoutCategoryZip[key]?.update(newTarget, at: index)
                            break
                        }
                    }
                    return .none
                }
            }
        }
        
        self.init(
            reducer: reducer,
            pumpingTextCellStore: .init()
        )
    }
}
