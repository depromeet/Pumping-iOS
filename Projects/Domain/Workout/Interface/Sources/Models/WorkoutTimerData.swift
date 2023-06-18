//
//  WorkoutData.swift
//  DomainWorkoutInterface
//
//  Created by 송영모 on 2023/06/18.
//

import Foundation

public struct WorkoutTimerInfo: Equatable {
    public let id: UUID
    public let categoryIdentifier: WorkoutCategoryIdentifier
    public var second: Int
    
    public var startPoint: Int
    public var isActive: Bool
    
    public init(
        id: UUID,
        categoryIdentifier: WorkoutCategoryIdentifier,
        second: Int = 0,
        startPoint: Int = 0,
        isActive: Bool = false
    ) {
        self.id = id
        self.categoryIdentifier = categoryIdentifier
        self.second = second
        self.startPoint = startPoint
        self.isActive = isActive
    }
}
