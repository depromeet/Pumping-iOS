//
//  UserEndpoint.swift
//  DomainUserInterface
//
//  Created by 송영모 on 2023/07/13.
//

import Foundation

import Core

public struct UserEndpoint {
    public static func fetchUser() -> Endpoint<UserInfoResponseDTO> {
        let accessToken = KeyChainStore.shared.load(property: .accessToken)
        
        return Endpoint(path: "users",
                        httpMethod: .get,
                        headers: ["Authorization" : "Bearer \(accessToken)"])
    }
    
    public static func deleteUser() -> Endpoint<EmptyData> {
        let accessToken = KeyChainStore.shared.load(property: .accessToken)
        
        return Endpoint(path: "users",
                        httpMethod: .delete,
                        headers: ["Authorization" : "Bearer \(accessToken)"])
    }
}
