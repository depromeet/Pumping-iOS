//
//  ProfileStore.swift
//  FeatureProfileInterface
//
//  Created by Derrick kim on 2023/06/18.
//

import ComposableArchitecture

import FeatureProfileInterface

import Domain
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
                    .send(.fetchWorkoutRequest)
                ])
                
            case .tapWithdrawButton:
                return .send(.deleteUserRequest)
                
            case let .selectProfileWorkout(index):
                let workout = state.profileWorkoutInfo?.workouts[safe: index]
                
                state.time = workout?.totalTime ?? 0
                state.calorie = workout?.totalCalories ?? 0
                state.heartRate = workout?.averageHeartbeat ?? 0
                state.maxWorkoutCategory = workout?.maxWorkoutPart ?? .up
                state.maxWorkoutTime = workout?.maxWorkoutPartTime ?? 0
                
                return .none
                
            case .fetchWorkoutRequest:
                return .task { [userId = state.userId] in
                    await .fetchWorkoutResponse(
                        TaskResult {
                            try await workoutClient.fetchWorkout(userId)
                        }
                    )
                }
                
            case let .fetchWorkoutResponse(.success(profileWorkoutInfo)):
                state.profileWorkoutInfo = profileWorkoutInfo
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
