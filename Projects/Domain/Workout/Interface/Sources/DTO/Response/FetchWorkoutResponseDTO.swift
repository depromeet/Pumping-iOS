//
//  FetchWorkoutRequestDTO.swift
//  DomainWorkoutInterface
//
//  Created by 송영모 on 2023/07/10.
//

import Foundation

// MARK: - FetchWorkoutResponseDTO
public struct FetchWorkoutResponseDTO: Codable {
    let workouts: [FetchWorkoutDTO]
    
    public func toDomain() -> ProfileWorkoutInfo {
        return .init(workouts: workouts.map {
            return .init(
                workoutDate: $0.workoutDate,
                totalTime: $0.totalTime,
                averageHeartbeat: $0.averageHeartbeat,
                totalCalories: $0.totalCalories,
                maxWorkoutPart: $0.maxWorkoutPart,
                maxWorkoutPartTime: $0.maxWorkoutPartTime)
        })
    }
}

// MARK: - FetchWorkoutDTO
public struct FetchWorkoutDTO: Codable {
    let workoutDate: String
    let totalTime, averageHeartbeat, totalCalories: Int
    let maxWorkoutPart: WorkoutCategory
    let maxWorkoutPartTime: Int
}
