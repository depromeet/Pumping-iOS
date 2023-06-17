//
//  AuthClient.swift
//  DomainAuthTesting
//
//  Created by 송영모 on 2023/05/05.
//

import Foundation
import ComposableArchitecture
import DomainAuthInterface
import CoreKeyChainStoreInterface

extension AuthClient: DependencyKey {
    public static let liveValue = AuthClient(
        setUserInfo: { userInfo in
            LocalAuthStore().setUserInfo(userInfo: userInfo)
        },
        getUserInfo: {
            return LocalAuthStore().getUserInfo()
        }
    )
}

extension DependencyValues {
    public var authClient: AuthClient {
        get { self[AuthClient.self] }
        set { self[AuthClient.self] = newValue }
    }
}
