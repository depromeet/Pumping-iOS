//
//  CrewInfo.swift
//  DomainCrewInterface
//
//  Created by 박현우 on 2023/07/08.
//

import Foundation

public struct CrewInfo: Equatable {
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
