//
//  AuthClient.swift
//  DomainAuthInterface
//
//  Created by 송영모 on 2023/05/05.
//

import Foundation
import ComposableArchitecture
import AuthenticationServices

public struct AuthClient {
    public var setUserInfo: (ASAuthorizationAppleIDCredential) -> Void
    public var getUserInfo: @Sendable () -> UserInfo
   
    public init(setUserInfo: @escaping (ASAuthorizationAppleIDCredential) -> Void,
                getUserInfo: @Sendable @escaping () -> UserInfo) {
        self.setUserInfo = setUserInfo
        self.getUserInfo = getUserInfo
    }
}

extension AuthClient: TestDependencyKey {
    public static var previewValue = Self(
        setUserInfo: unimplemented("\(Self.self).setUserInfo"),
        getUserInfo: unimplemented("\(Self.self).getUserInfo")
    )
    
    public static let testValue = Self(
        setUserInfo: unimplemented("\(Self.self).setUserInfo"),
        getUserInfo: unimplemented("\(Self.self).getUserInfo")
    )
}
