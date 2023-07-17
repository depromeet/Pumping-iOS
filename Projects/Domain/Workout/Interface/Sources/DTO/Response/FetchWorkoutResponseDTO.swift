//
//  FetchWorkoutRequestDTO.swift
//  DomainWorkoutInterface
//
//  Created by 송영모 on 2023/07/10.
//

import Foundation

public struct FetchWorkoutResponseDTO: Codable {
    let workouts: [WorkoutElementDTO]
    
    public func toDomain() -> ProfileWorkoutInfo {
        return .init(workouts: workouts.map {
            return .init(
                workoutDate: $0.workout.workoutDate,
                totalTime: $0.workout.totalTime,
                averageHeartbeat: $0.workout.averageHeartbeat,
                totalCalories: $0.workout.totalCalories,
                maxWorkoutPart: $0.workout.maxWorkoutPart,
                maxWorkoutPartTime: $0.workout.maxWorkoutPartTime)
        })
    }
}

public struct WorkoutElementDTO: Codable {
    let dayOfWeek: String
    let workout: WorkoutDataDTO
}

public struct WorkoutDataDTO: Codable {
    let workoutDate: String
    let totalTime, averageHeartbeat, totalCalories: Int
    let maxWorkoutPart: WorkoutCategory
    let maxWorkoutPartTime: Int
}
