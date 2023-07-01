//
//  TimerDTO.swift
//  DomainWorkoutInterface
//
//  Created by 송영모 on 2023/06/24.
//

import Foundation

struct TimerDTO: Codable {
    let timerID, userID, time: String
    let category: [String]
    let calories, count, heartbeat, kg: String
    let sets, machineType: String

    enum CodingKeys: String, CodingKey {
        case timerID = "timerId"
        case userID = "userId"
        case time, category, calories, count, heartbeat, kg, sets, machineType
    }
}
