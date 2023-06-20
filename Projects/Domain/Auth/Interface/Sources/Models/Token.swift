//
//  Token.swift
//  DomainAuthInterface
//
//  Created by 박현우 on 2023/05/16.
//

import Foundation

public struct Token: Equatable {
    public let accessToken: String?
    public let expiresAt: String?
    public let loginType: String
    public let oauth2Id: String
    
    public init(accessToken: String?,
                expiresAt: String?,
                loginType: String,
                oauth2Id: String) {
        self.accessToken = accessToken
        self.expiresAt = expiresAt
        self.loginType = loginType
        self.oauth2Id = oauth2Id
    }
}

public extension Token {
    static let mock = Self(accessToken: "mockAccessToken", expiresAt: "2023-10-23", loginType: "Apple", oauth2Id: "MockoAuth2Id")
}
