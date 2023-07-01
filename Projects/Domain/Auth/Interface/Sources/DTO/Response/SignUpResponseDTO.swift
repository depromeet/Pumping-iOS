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
    
    enum CodingKeys: String, CodingKey {
        case accessToken
        case expiresAt = "expiredTime"
    }
    
    public init(accessToken: String?, expiresAt: String?) {
        self.accessToken = accessToken
        self.expiresAt = expiresAt
    }
    
    public func toDomain() -> Token {
        return Token(accessToken: accessToken,
                     expiresAt: expiresAt,
                     loginType: nil,
                     oauth2Id: nil)
    }
}

public extension SignUpResponseDTO {
    static let mock = SignUpResponseDTO(accessToken: "MockAccessToken", expiresAt: "2023-06-29T10:59:14.131+00:00")
}
