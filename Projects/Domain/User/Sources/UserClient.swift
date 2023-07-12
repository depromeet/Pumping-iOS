//
//  UserClient.swift
//  DomainUserInterface
//
//  Created by 송영모 on 2023/07/13.
//

import Foundation

import ComposableArchitecture

import DomainUserInterface

import Core

extension UserClient: DependencyKey {
    public static let liveValue = UserClient(
        fetchUser: {
            let apiEndpoint = UserEndpoint.fetchUser()
            let response = try await NetworkProvider.shared.sendRequest(apiEndpoint).toDomain()
            
            return response
        },
        deleteUser: {
            let apiEndpoint = UserEndpoint.deleteUser()
            let response = try await NetworkProvider.shared.sendRequest(apiEndpoint)
            
            return response
        }
    )
    
}

extension DependencyValues {
    public var userClient: UserClient {
        get { self[UserClient.self] }
        set { self[UserClient.self] = newValue }
    }
}
