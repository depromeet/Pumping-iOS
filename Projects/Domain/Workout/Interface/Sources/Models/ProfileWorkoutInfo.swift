//
//  ProfileInfo.swift
//  DomainWorkoutInterface
//
//  Created by 송영모 on 2023/07/10.
//

import Foundation

public struct ProfileWorkoutInfo: Codable, Equatable {
    public let workoutElements: [ProfileWorkoutElement]
}

public struct ProfileWorkoutElement: Codable, Equatable, Hashable {
    public let dayOfWeek: String
    public let workout: ProfileWorkout?
}

public struct ProfileWorkout: Codable, Equatable, Hashable {
    public let workoutDate: String
    public let totalTime, averageHeartbeat, totalCalories: Int
    public let maxWorkoutCategory: WorkoutCategory
    public let maxWorkoutCategoryTime: Int
}
