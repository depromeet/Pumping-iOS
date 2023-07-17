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
        return .init(workoutElements: workouts.map { $0.toDomain() })
    }
}

public struct WorkoutElementDTO: Codable {
    let dayOfWeek: String
    let workout: WorkoutDataDTO?
    
    public func toDomain() -> ProfileWorkoutElement {
        if let workout = workout {
            return .init(
                dayOfWeek: dayOfWeek,
                workout: .init(
                    workoutDate: workout.workoutDate,
                    totalTime: workout.totalTime,
                    averageHeartbeat: workout.averageHeartbeat,
                    totalCalories: workout.totalCalories,
                    maxWorkoutPart: workout.maxWorkoutPart,
                    maxWorkoutPartTime: workout.maxWorkoutPartTime))
        } else {
            return .init(dayOfWeek: dayOfWeek, workout: nil)
        }
    }
}

public struct WorkoutDataDTO: Codable {
    let workoutDate: String
    let totalTime, averageHeartbeat, totalCalories: Int
    let maxWorkoutPart: WorkoutCategory
    let maxWorkoutPartTime: Int
}
