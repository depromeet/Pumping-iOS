//
//  CrewDetailResponseDTO.swift
//  DomainCrewInterface
//
//  Created by 박현우 on 2023/07/01.
//

import Foundation

public struct CrewDetailResponseDTO: Codable {
    
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
    
    
    public func toDomain() -> CrewDetail {
        return CrewDetail(crewId: crewId, crewName: crewName, goalCount: goalCount, code: code, participants: participants)
    }
}

public extension CrewDetailResponseDTO {
    static let mock = CrewDetailResponseDTO(crewId: "1", crewName: "8이팅", goalCount: 3, code: "XCKDd2ew", participants: ["현우", "영모", "태현"])
}
