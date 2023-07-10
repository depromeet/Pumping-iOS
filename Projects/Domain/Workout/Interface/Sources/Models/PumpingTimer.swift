//
//  WorkoutData.swift
//  DomainWorkoutInterface
//
//  Created by 송영모 on 2023/06/18.
//

import Foundation

public struct PumpingTimer: Codable, Equatable {
    public let id: UUID
    public let workoutCategoryIdentifier: WorkoutPart
    public var time: Int
    
    public var heartRateSum: Double
    public var heartRateCount: Int
    public var calorie: Double
    
    public var pinTime: Int
    public var isActive: Bool
    
    public init(
        id: UUID,
        workoutCategoryIdentifier: WorkoutPart,
        time: Int = 0,
        heartRateSum: Double = 0.0,
        heartRateCount: Int = 0,
        calorie: Double = 0,
        pinTime: Int = 0,
        isActive: Bool = false
    ) {
        self.id = id
        self.workoutCategoryIdentifier = workoutCategoryIdentifier
        self.time = time
        self.heartRateSum = heartRateSum
        self.heartRateCount = heartRateCount
        self.calorie = calorie
        self.pinTime = pinTime
        self.isActive = isActive
    }
}

public extension PumpingTimer {
    func toDTO() -> TimerDTO {
        return .init(
            time: time,
            heartbeat: Int(heartRateSum / Double(heartRateCount == 0 ? 1 : heartRateCount)),
            calories: Int(calorie),
            workoutPart: workoutCategoryIdentifier.rawValue,
            workoutSets: [] //TODO: 운동 세트 기록 기능 추가 후 개발
        )
    }
}
