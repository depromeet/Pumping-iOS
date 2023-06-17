//
//  Token.swift
//  DomainAuthInterface
//
//  Created by 박현우 on 2023/05/16.
//

import Foundation

public struct Token: Equatable {
    public init(accessToken: String, refreshToken: String, expiresAt: String) {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
        self.expiresAt = expiresAt
    }
    
    public let accessToken: String
    public let refreshToken: String
    public let expiresAt: String
}

public extension Token {
    static let mock = Self(accessToken: "mockAccessToken", refreshToken: "mockRefreshToken", expiresAt: "2023-10-23")
}
