//
//  BypassFetchCrewRequestDTO.swift
//  DomainCrewInterface
//
//  Created by 송영모 on 2023/07/13.
//

import Foundation

public struct BypassFetchCrewRequestDTO: Codable {
    public let userID, crewID: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case crewID = "crewId"
    }
    
    public init(userID: String, crewID: String) {
        self.userID = userID
        self.crewID = crewID
    }
}
