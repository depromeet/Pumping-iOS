//
//  WorkoutRootStore.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/23.
//

import Foundation
import ComposableArchitecture

import FeatureWorkoutInterface

extension WorkoutRootStore {
    public init() {
        let reducer: Reduce<State, Action> = .init { state, action in
            switch action {
            case .binding:
                return .none
                
            case .startButtonTapped:
//                state.workoutHome = .init()
//                state.path.append(.selectWorkoutCategoryType)
                state.workoutEnd = .init()
                state.path.append(.workoutEnd)
                return .none
                
            case let .workoutHome(action):
                switch action {
                case .goToWorkoutStart:
                    state.workoutStart = .init()
                    state.path.append(.workoutStart)
                    return .none
                    
                default:
                    return .none
                }
            case let .workoutStart(action):
                switch action {
                case .goToWorkoutTimer:
                    state.workoutTimer = .init(workoutCategoryIdentifiers: [.back, .aerobic, .butt])
                    state.path.append(.workoutTimer)
                    return .none
                    
                default:
                    return .none
                }
                
            case let .workoutTimer(action):
                switch action {
                case .goToWorkoutEnd:
                    state.workoutEnd = .init()
                    state.path.append(.workoutEnd)
                    return .none
                    
                default:
                    return .none
                }
            case let .workoutEnd(action):
                switch action {
                case .backToRoot:
                    state.path = []
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
