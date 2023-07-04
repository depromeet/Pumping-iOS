//
//  PumpingTimerData.swift
//  DomainWorkoutInterface
//
//  Created by 송영모 on 2023/07/04.
//

import Foundation

public struct PumpingTimerData: Codable, Equatable {
    public let timers: [PumpingTimer]
    public let updatedTime: Double
    public let isHardPush: Bool
    
    public init(timers: [PumpingTimer], updatedTime: Double, isHardPush: Bool = false) {
        self.timers = timers
        self.updatedTime = updatedTime
        self.isHardPush = isHardPush
    }
}
