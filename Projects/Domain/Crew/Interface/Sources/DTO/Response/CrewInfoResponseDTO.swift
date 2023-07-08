//
//  CrewInfoResponseDTO.swift
//  DomainCrewInterface
//
//  Created by 박현우 on 2023/07/08.
//

import Foundation

public struct CrewInfoResponseDTO: Codable, Equatable {
    
    public let crewName: String
    public let crewId: String
    public let createDate: String
    
    public init(crewName: String,
                crewId: String,
                createDate: String) {
        self.crewName = crewName
        self.crewId = crewId
        self.createDate = createDate
    }
    
    public func toDomain() -> CrewInfo {
        return CrewInfo(crewName: crewName, crewId: crewId, createDate: createDate)
    }
}

public extension CrewInfoResponseDTO {
    static let mock = CrewInfoResponseDTO(crewName: "너만 오면 고", crewId: "fikemjwmn", createDate: "")
}
