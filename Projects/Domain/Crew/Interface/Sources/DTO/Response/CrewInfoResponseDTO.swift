//
//  CrewInfoResponseDTO.swift
//  DomainCrewInterface
//
//  Created by 박현우 on 2023/07/08.
//

import Foundation

public struct CrewInfoResponseDTO: Codable, Equatable {
    
    public let crews: [CrewInfoResponseItemDTO]
    
    public func toDomain() -> [CrewInfo] {
        return crews.map{
            CrewInfo(crewName: $0.crewName, crewId: $0.crewId, code: $0.code, createDate: $0.createDate)
        }
    }
}

public struct CrewInfoResponseItemDTO: Codable, Equatable {
    public let crewName: String
    public let crewId: String
    public let code: String
    public let createDate: String
    
    public init(crewName: String,
                crewId: String,
                code: String,
                createDate: String) {
        self.crewName = crewName
        self.crewId = crewId
        self.code = code
        self.createDate = createDate
    }
}

public extension CrewInfoResponseItemDTO {
    static let mock = CrewInfoResponseItemDTO(crewName: "너만 오면 고",
                                              crewId: "fikemjwmn",
                                              code: "dd",
                                              createDate: "")
}

public extension CrewInfoResponseDTO {
    static let mock = CrewInfoResponseDTO(crews: [CrewInfoResponseItemDTO.mock])
}
