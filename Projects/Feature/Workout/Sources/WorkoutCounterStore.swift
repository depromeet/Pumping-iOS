//
//  WorkoutCounterStore.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/06/06.
//

import Foundation
import ComposableArchitecture

import FeatureWorkoutInterface

extension WorkoutCounterStore {
    public init() {
        let reducer: Reduce<State, Action> = .init { state, action in
            switch action {
            case .binding: return .none
                
            case .onAppear: return .none
                
            case .dismiss: return .none
            }
        }
        
        self.init(
            reducer: reducer
        )
    }
}
