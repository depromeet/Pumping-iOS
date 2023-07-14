//
//  UserClient.swift
//  DomainUserInterface
//
//  Created by 송영모 on 2023/07/13.
//

import Foundation

import ComposableArchitecture

import Core

public struct UserClient {
    public var fetchUser: @Sendable () async throws -> UserInfo
    public var deleteUser: @Sendable () async throws -> EmptyData
    
    public init(fetchUser: @escaping @Sendable () async throws -> UserInfo,
                deleteUser: @escaping @Sendable () async throws -> EmptyData) {
        self.fetchUser = fetchUser
        self.deleteUser = deleteUser
    }
}

extension UserClient: TestDependencyKey {
    public static var previewValue = Self(
        fetchUser: unimplemented("\(Self.self).fetchUser"),
        deleteUser: unimplemented("\(Self.self).deleteUser")
    )
    
    public static let testValue = Self(
        fetchUser: unimplemented("\(Self.self).fetchUser"),
        deleteUser: unimplemented("\(Self.self).deleteUser")
    )
}
