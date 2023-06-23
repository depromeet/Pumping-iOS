//
//  WorkoutRecordStore.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/06/19.
//

import Foundation

import ComposableArchitecture

import FeatureWorkoutInterface

extension WorkoutRecordStore {
    public init() {
        let reducer: Reduce<State, Action> = .init { state, action in
            switch action {
            case .binding:
                return .none
                
            case .onAppear:
                return .none
                
            case .completeButtonTapped:
                return .none
            }
        }
        
        self.init(
            reducer: reducer
        )
    }
}
