//
//  CrewInfo.swift
//  DomainCrewInterface
//
//  Created by 박현우 on 2023/06/24.
//

import Foundation

public struct CrewInfo: Equatable {
    public let crewId: String
    public let crewName: String
    public let goalCount: Int
    public let code: String
    public let participants: [String]
    
    public init(crewId: String,
                crewName: String,
                goalCount: Int,
                code: String,
                participants: [String]) {
        self.crewId = crewId
        self.crewName = crewName
        self.goalCount = goalCount
        self.code = code
        self.participants = participants
    }
}
