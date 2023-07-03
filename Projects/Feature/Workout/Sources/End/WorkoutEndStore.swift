//
//  WorkoutEndStore.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/23.
//

import Foundation
import ComposableArchitecture

import FeatureWorkoutInterface

extension WorkoutEndStore {
    public init() {
        
        @Dependency(\.workoutClient) var workoutClient

        let reducer: Reduce<State, Action> = .init { state, action in
            switch action {
            case .binding:
                return .none
                
            case .completeButtonTapped:
                return .send(.makeWorkoutRequest(timer: state.timers))
                
            case .timerSummaryCells:
                return .none
                
            case let .makeWorkoutRequest(timers):
                return .task { [timers = timers] in
                    await .makeWorkoutResponse(id: TaskResult {
                        try await workoutClient.makeWorkout(timers)
                    })
                }
                
            case .makeWorkoutResponse:
                return .send(.backToRoot)
                
            case .backToRoot:
                return .none
            }
        }
        
        self.init(
            reducer: reducer
        )
    }
}
