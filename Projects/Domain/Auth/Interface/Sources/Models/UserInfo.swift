//
//  UserInfo.swift
//  DomainAuthInterface
//
//  Created by 박현우 on 2023/06/06.
//

import Foundation

public struct UserInfo : Equatable {
    public init(userIdentifier: String?,
                name: String?,
                email: String?,
                identityToken: String?,
                authorizationCode: String?
    ) {
        self.userIdentifier = userIdentifier
        self.name = name
        self.email = email
        self.identityToken = identityToken
        self.authorizationCode = authorizationCode
    }
    
    public let userIdentifier : String?
    public let name : String?
    public let email : String?
    public let identityToken : String?
    public let authorizationCode : String?
}

public extension UserInfo {
    static let mock = Self(userIdentifier: "mockUserID",
                           name: "현우",
                           email: "parkhj0423@naver.com",
                           identityToken: "mockIdentifyToken",
                           authorizationCode: "mockAuthroziationCode")
}
