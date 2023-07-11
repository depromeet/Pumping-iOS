//
//  ProfileInfo.swift
//  DomainWorkoutInterface
//
//  Created by 송영모 on 2023/07/10.
//

import Foundation

// MARK: - ProfileWorkoutInfo
public struct ProfileWorkoutInfo {
    public let workouts: [ProfileWorkout]
}

// MARK: - ProfileWorkout
public struct ProfileWorkout: Codable {
    let workoutDate: String
    let totalTime, averageHeartbeat, totalCalories: Int
    let maxWorkoutPart: WorkoutCategory
    let maxWorkoutPartTime: Int
}
