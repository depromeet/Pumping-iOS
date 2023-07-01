//
//  MakeCrewRequestDTO.swift
//  DomainCrewInterface
//
//  Created by 박현우 on 2023/07/01.
//

import Foundation

public struct MakeCrewRequestDTO: Encodable, Equatable {
    let crewName: String
    let goalCount: Int
    
    public init(crewName: String, goalCount: Int) {
        self.crewName = crewName
        self.goalCount = goalCount
    }
}

public extension MakeCrewRequestDTO {
    static let mock = Self(crewName: "8이팅", goalCount: 3)
}
