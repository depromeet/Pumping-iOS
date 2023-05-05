//
//  LoginRequest.swift
//  DomainLoginInterface
//
//  Created by 송영모 on 2023/05/05.
//

import Foundation

public struct SignUpRequest: Codable {
    let name: String
    let email: String
    
    public init(name: String, email: String) {
        self.name = name
        self.email = email
    }
}

public extension SignUpRequest {
    static let mock = Self(name: "annapo", email: "annapo@gmail.com")
}
