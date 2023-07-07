//
//  MakeWorkoutRequestDTO.swift
//  DomainWorkoutInterface
//
//  Created by 송영모 on 2023/06/30.
//

import Foundation

// MARK: - Welcome

public struct MakeWorkoutRequestDTO: Codable {
    let timers: [TimerDTO]
    
    public init(timers: [TimerDTO]) {
        self.timers = timers
    }
}

// MARK: - Timer

public struct TimerDTO: Codable {
    let time, heartbeat, calories: Int
    let workoutPart: String
    let workoutSets: [WorkoutSetDTO]
}

// MARK: - WorkoutSet

public struct WorkoutSetDTO: Codable {
    let machine: String
    let kg, sets: Int
}
