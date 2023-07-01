//
//  MakeCrewResponseDTO.swift
//  DomainCrewInterface
//
//  Created by 박현우 on 2023/07/01.
//

import Foundation

public struct MakeCrewResponseDTO: Codable {
    
    let crewId: String
    let crewName: String
    let goalCount: Int
    let code: String
    let participants: [String]
    
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
    
    
    public func toDomain() -> CrewInfo {
        return CrewInfo(crewId: crewId, crewName: crewName, goalCount: goalCount, code: code, participants: participants)
    }
}

public extension MakeCrewResponseDTO {
    static let mock = MakeCrewResponseDTO(crewId: "1", crewName: "8이팅", goalCount: 3, code: "XCKDd2ew", participants: ["현우", "영모", "태현"])
}
