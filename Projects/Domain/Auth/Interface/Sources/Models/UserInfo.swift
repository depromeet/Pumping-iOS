//
//  UserInfo.swift
//  DomainAuthInterface
//
//  Created by 박현우 on 2023/06/06.
//

import Foundation

public struct UserInfo : Equatable {
    public let name: String
    public let gender: GenderType
    public let height: Int
    public let weight: Int
    public let characterType: CharacterType
    public let loginType: String
    public let oauth2Id: String
    
    public init(name: String,
                gender: GenderType,
                height: Int,
                weight: Int,
                characterType: CharacterType,
                loginType: String,
                oauth2Id: String) {
        self.name = name
        self.gender = gender
        self.height = height
        self.weight = weight
        self.characterType = characterType
        self.loginType = loginType
        self.oauth2Id = oauth2Id
    }
}

public extension UserInfo {
    static let mock = UserInfo(name: "박현우",
                               gender: .male,
                               height: 185,
                               weight: 80,
                               characterType: .b,
                               loginType: "APPLE",
                               oauth2Id: "mockoAuth2Id")
}
