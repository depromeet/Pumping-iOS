//
//  WorkoutClient.swift
//  DomainWorkoutInterface
//
//  Created by 송영모 on 2023/07/03.
//

import Foundation

import ComposableArchitecture

import DomainWorkoutInterface
import Core

extension WorkoutClient: DependencyKey {
    public static let liveValue = WorkoutClient(
        fetchWorkout: { userId in
            let apiEndpoint = WorkoutEndpoint.fetchWorkout(userId: userId)
            let response = try await NetworkProvider.shared.sendRequest(apiEndpoint).toDomain()
            
            return response
        },
        makeWorkout: { timers in
            let makeWorkoutRequestDTO = MakeWorkoutRequestDTO(timers: timers.map { $0.toDTO() })
            let apiEndpoint = WorkoutEndpoint.makeWorkout(makeWorkoutRequestDTO)
            let response = try await NetworkProvider.shared.sendRequest(apiEndpoint).toDomain()
            
            return response
        }
    )
}

extension DependencyValues {
    public var workoutClient: WorkoutClient {
        get { self[WorkoutClient.self] }
        set { self[WorkoutClient.self] = newValue }
    }
}
