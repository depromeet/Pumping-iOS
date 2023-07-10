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
}

// MARK: - FetchWorkoutDTO
public struct FetchWorkoutDTO: Codable {
    let workoutDate: String
    let totalTime, averageHeartbeat, totalCalories: Int
    let maxWorkoutPart: String
    let maxWorkoutPartTime: Int
}
