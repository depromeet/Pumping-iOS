//
//  UserInfoResponse.swift
//  DomainUserInterface
//
//  Created by 송영모 on 2023/07/13.
//

import Foundation

import DomainAuthInterface

public struct UserInfoResponseDTO: Codable {
    public let name: String
    public let characterType: CharacterType
    public let currentCrew: String?
    
    public func toDomain() -> UserInfo {
        return .init(name: name, characterType: characterType, currentCrew: currentCrew)
    }
}
