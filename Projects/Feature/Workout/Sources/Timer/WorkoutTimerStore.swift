//
//  WorkoutTimerStore.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/23.
//

import Foundation
import ComposableArchitecture

import FeatureWorkoutInterface

extension WorkoutTimerStore {
    public init() {
        let reducer: Reduce<State, Action> = .init { state, action in
            switch action {
            case .binding:
                return .none
                
            case .endButtonTapped:
                return .send(.goToWorkoutEnd)
                
            case let .timerCell(id, action):
                return .none
                
            case .goToWorkoutEnd:
                return .none
            }
        }
        
        self.init(
            reducer: reducer
        )
    }
}