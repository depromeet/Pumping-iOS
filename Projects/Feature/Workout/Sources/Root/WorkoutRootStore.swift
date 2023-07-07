//
//  WorkoutRootStore.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/23.
//

import Foundation
import ComposableArchitecture

import FeatureWorkoutInterface
import Domain

extension WorkoutRootStore {
    public init() {
        let reducer: Reduce<State, Action> = .init { state, action in
            switch action {
            case .binding:
                return .none
                
            case .startButtonTapped:
                state.workoutHome = .init()
                state.path.append(.home)
                return .none
                
            case let .workoutHome(action):
                switch action {
                case let .goToWorkoutStart(workoutCategoryIdentifiers):
                    state.workoutStart = .init(selectedWorkoutCategoryIdentifiers: workoutCategoryIdentifiers)
                    state.path.append(.start)
                    return .none
                    
                default:
                    return .none
                }
            case let .workoutStart(action):
                switch action {
                case let .goToWorkoutTimer(workoutCategoryIdentifiers):
                    state.workoutTimer = .init(selectedWorkoutCategoryIdentifiers: workoutCategoryIdentifiers)
                    state.path.append(.timer)
                    return .none
                    
                default:
                    return .none
                }
                
            case let .workoutTimer(action):
                switch action {
                case let .goToWorkoutEnd(timers):
                    state.workoutEnd = .init(timers: timers)
                    state.path.append(.end)
                    return .none
                    
                default:
                    return .none
                }
            case let .workoutEnd(action):
                switch action {
                case .backToRoot:
                    state.path = []
                    state.workoutHome = .init()
                    return .none
                    
                default:
                    return .none
                }
            }
        }
        
        self.init(
            reducer: reducer,
            workoutHomeStore: .init(),
            workoutStartStore: .init(),
            workoutTimerStore: .init(),
            workoutEndStore: .init()
        )
    }
}
