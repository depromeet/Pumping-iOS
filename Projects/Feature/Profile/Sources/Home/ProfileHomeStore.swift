//
//  ProfileStore.swift
//  FeatureProfileInterface
//
//  Created by Derrick kim on 2023/06/18.
//

import ComposableArchitecture

import FeatureProfileInterface
import DomainWorkout
import DomainUserInterface
import DomainUser
import Core
import Shared

extension ProfileHomeStore {
    public init() {
        @Dependency(\.workoutClient) var workoutClient
        @Dependency(\.userClient) var userClient
        
        let reducer : Reduce<State, Action> = Reduce { state, action in
            switch action {
            case .binding:
                return .none
                
            case .onAppear:
                return .concatenate([
                    .send(.fetchUserRequest),
                    .send(.fetchWorkoutRequest)
                ])
                
            case let .tapDayButton(index):
                state.selectedDay = index
                return .send(.selectProfileWorkout(index))
                
            case .tapWithdrawButton:
                return .send(.deleteUserRequest)
                
            case let .selectProfileWorkout(index):
                let workoutElement = state.workoutElements[safe: index]
                
                state.selectedWorkoutElement = workoutElement
                
                state.time = workoutElement?.workout?.totalTime ?? 0
                state.calorie = workoutElement?.workout?.totalCalories ?? 0
                state.heartRate = workoutElement?.workout?.averageHeartbeat ?? 0
                state.maxWorkoutCategory = workoutElement?.workout?.maxWorkoutCategory ?? .up
                state.maxWorkoutCategoryTime = workoutElement?.workout?.maxWorkoutCategoryTime ?? 0
                
                return .none
                
            case .fetchWorkoutRequest:
                return .task { [userId = state.userId] in
                    await .fetchWorkoutResponse(
                        TaskResult {
                            try await workoutClient.fetchWorkout(userId)
                        }
                    )
                }
                
            case .fetchUserRequest:
                return .task {
                    await .fetchUserResponse(
                        TaskResult {
                            try await userClient.fetchUser()
                        }
                    )
                }
                
            case let .fetchUserResponse(.success(userInfo)):
                state.userName = userInfo.name
                state.characterType = userInfo.characterType
                return .none
                
            case let .fetchWorkoutResponse(.success(profileWorkoutInfo)):
                state.workoutElements = profileWorkoutInfo.workoutElements
                return .send(.selectProfileWorkout(state.selectedDay))
                
            case .deleteUserRequest:
                return .task {
                    await .deleteUserResponse(
                        TaskResult {
                            try await userClient.deleteUser()
                        }
                    )
                }
                
            case .deleteUserResponse:
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
