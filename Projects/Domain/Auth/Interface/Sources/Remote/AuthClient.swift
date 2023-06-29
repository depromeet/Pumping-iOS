//
//  AuthClient.swift
//  DomainAuthInterface
//
//  Created by 송영모 on 2023/05/05.
//

import Foundation
import ComposableArchitecture

public struct AuthClient {
    public var signInWithApple: @Sendable (String) async throws -> Token
    public var signUp: @Sendable (UserInfo) async throws -> Token
    public var saveToken: (Token) -> Void
    public var loadToken: @Sendable () -> Token
   
    public init(signInWithApple: @escaping @Sendable (String) async throws -> Token,
                signUp: @escaping @Sendable (UserInfo) async throws -> Token,
                saveToken: @escaping (Token) -> Void,
                loadToken: @escaping @Sendable () -> Token) {
        self.signInWithApple = signInWithApple
        self.signUp = signUp
        self.saveToken = saveToken
        self.loadToken = loadToken
    }
}

extension AuthClient: TestDependencyKey {
    public static var previewValue = Self(
        signInWithApple: unimplemented("\(Self.self).signInWithApple"),
        signUp: unimplemented("\(Self.self).signUp"),
        saveToken: unimplemented("\(Self.self).saveToken"),
        loadToken: unimplemented("\(Self.self).loadToken")
    )
    
    public static let testValue = Self(
        signInWithApple: unimplemented("\(Self.self).signInWithApple"),
        signUp: unimplemented("\(Self.self).signUp"),
        saveToken: unimplemented("\(Self.self).saveToken"),
        loadToken: unimplemented("\(Self.self).loadToken")
    )
}
