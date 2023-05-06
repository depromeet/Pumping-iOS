//
//  LoginResponse.swift
//  DomainLoginInterface
//
//  Created by 송영모 on 2023/05/05.
//

import Foundation

public struct SignUpResponse: Codable {
    let token: String
    
    public init(token: String) {
        self.token = token
    }
}

public extension SignUpResponse {
    static let mock = Self(token: "ABC")
}
