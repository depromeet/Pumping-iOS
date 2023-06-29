//
//  LoginRequest.swift
//  DomainLoginInterface
//
//  Created by 송영모 on 2023/05/05.
//

import Foundation

public struct SignUpRequestDTO: Codable {
    let name: String
    let gender: String
    let height: Int
    let weight: Int
    let characterType: String
    let loginType: String
    let oauth2Id: String
    
    public init(name: String,
                gender: String,
                height: Int,
                weight: Int,
                characterType: String,
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

public extension SignUpRequestDTO {
    static let mock = SignUpRequestDTO(name: "박현우",
                                       gender: "MALE",
                                       height: 185,
                                       weight: 80,
                                       characterType: "B",
                                       loginType: "APPLE",
                                       oauth2Id: "mockoAuth2Id")
}
