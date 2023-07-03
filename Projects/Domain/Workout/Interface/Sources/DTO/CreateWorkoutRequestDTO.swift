//
//  CreateWorkoutRequestDTO.swift
//  DomainWorkoutInterface
//
//  Created by 송영모 on 2023/06/30.
//

import Foundation

// MARK: - Welcome
struct CreateWorkoutRequestDTO: Codable {
    let timers: [TimerDTO]
}

// MARK: - Timer
struct TimerDTO: Codable {
    let time, heartbeat, calories: Int
    let workoutPart: String
    let workoutSets: [WorkoutSetDTO]
}

// MARK: - WorkoutSet
struct WorkoutSetDTO: Codable {
    let machine: String
    let kg, sets: Int
}
