//
//  CrewInfo.swift
//  DomainCrewInterface
//
//  Created by 박현우 on 2023/06/24.
//

import Foundation

public struct CrewInfo {
    let crewId: String
    let crewName: String
    let goalCount: Int
    let code: String
    let participants: [String]
    
    init(crewId: String,
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