//
//  WorkoutData.swift
//  DomainWorkoutInterface
//
//  Created by 송영모 on 2023/06/18.
//

import Foundation

public struct PumpingTimer: Equatable {
    public let id: UUID
    public let workoutCategoryIdentifier: WorkoutCategoryIdentifier
    public var time: Int
    
    public var pinTime: Int
    public var isActive: Bool
    
    public init(
        id: UUID,
        workoutCategoryIdentifier: WorkoutCategoryIdentifier,
        time: Int = 0,
        pinTime: Int = 0,
        isActive: Bool = false
    ) {
        self.id = id
        self.workoutCategoryIdentifier = workoutCategoryIdentifier
        self.time = time
        self.pinTime = pinTime
        self.isActive = isActive
    }
}
