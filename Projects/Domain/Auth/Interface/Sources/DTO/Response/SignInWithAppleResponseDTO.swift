//
//  SignInResponseDTO.swift
//  DomainAuthInterface
//
//  Created by 송영모 on 2023/05/05.
//

import Foundation

public struct SignInWithAppleResponseDTO: Decodable, Equatable {
    let accessToken: String?
    let expiresAt: String?
    let loginType: String
    let oauth2Id: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken
        case expiresAt = "expiredTime"
        case loginType
        case oauth2Id
    }
    
    public init(accessToken: String?,
                expiresAt: String?,
                loginType: String,
                oauth2Id: String) {
        self.accessToken = accessToken
        self.expiresAt = expiresAt
        self.loginType = loginType
        self.oauth2Id = oauth2Id
    }
    
    public func toDomain() -> Token {
        return Token(accessToken: accessToken,
                     expiresAt: expiresAt,
                     userId: nil,
                     loginType: loginType,
                     oauth2Id: oauth2Id)
    }
}

public extension SignInWithAppleResponseDTO {
    static let mock = Self(accessToken: "MOCKACCESSTOKEN", expiresAt: "2023-06-30", loginType: "APPLE", oauth2Id: "USERID")
}
