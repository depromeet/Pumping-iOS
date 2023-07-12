//
//  LoginResponse.swift
//  DomainLoginInterface
//
//  Created by 송영모 on 2023/05/05.
//

import Foundation

public struct SignUpResponseDTO: Codable {
    let accessToken: String?
    let expiresAt: String?
    let userId: String?
    
    enum CodingKeys: String, CodingKey {
        case accessToken
        case expiresAt = "expiredTime"
        case userId
    }
    
    public init(accessToken: String?,
                expiresAt: String?,
                userId: String?) {
        self.accessToken = accessToken
        self.expiresAt = expiresAt
        self.userId = userId
    }
    
    public func toDomain() -> Token {
        return Token(accessToken: accessToken,
                     expiresAt: expiresAt,
                     userId: userId,
                     loginType: nil,
                     oauth2Id: nil)
    }
}

public extension SignUpResponseDTO {
    static let mock = SignUpResponseDTO(accessToken: "MockAccessToken",
                                        expiresAt: "2023-06-29T10:59:14.131+00:00",
                                        userId: "MockUserId")
}
