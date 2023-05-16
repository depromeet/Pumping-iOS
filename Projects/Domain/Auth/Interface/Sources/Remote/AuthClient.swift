//
//  AuthClient.swift
//  DomainAuthInterface
//
//  Created by 송영모 on 2023/05/05.
//

import Foundation
import ComposableArchitecture

public struct AuthClient {
    public var signUp: @Sendable (SignUpRequest) async throws -> SignUpResponse
    public var signOut: @Sendable (SignOutRequest) async throws -> SignOutResponse
    
    public init(signUp: @Sendable @escaping (SignUpRequest) -> SignUpResponse, signOut: @Sendable @escaping (SignOutRequest) -> SignOutResponse) {
        self.signUp = signUp
        self.signOut = signOut
    }
}

extension AuthClient: TestDependencyKey {
    public static let previewValue = Self(
        signUp: { _ in .mock },
        signOut: { _ in .mock }
    )

    public static let testValue = Self(
        signUp: unimplemented("\(Self.self).signUp"),
        signOut: unimplemented("\(Self.self).signOut")
    )
}

extension DependencyValues {
    var authClient: AuthClient {
        get { self[AuthClient.self] }
        set { self[AuthClient.self] = newValue }
    }
}
