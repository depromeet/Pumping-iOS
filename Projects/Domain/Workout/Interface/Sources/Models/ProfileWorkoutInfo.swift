//
//  ProfileInfo.swift
//  DomainWorkoutInterface
//
//  Created by 송영모 on 2023/07/10.
//

import Foundation

// MARK: - ProfileWorkoutInfo
public struct ProfileWorkoutInfo: Equatable {
    public let workouts: [ProfileWorkout]
}

// MARK: - ProfileWorkout
public struct ProfileWorkout: Equatable {
    public let workoutDate: String
    public let totalTime, averageHeartbeat, totalCalories: Int
    public let maxWorkoutPart: WorkoutCategory
    public let maxWorkoutPartTime: Int
}
