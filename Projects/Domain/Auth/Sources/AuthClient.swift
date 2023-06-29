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
import CoreNetwork

extension AuthClient: DependencyKey {
    public static let liveValue = AuthClient(
        signInWithApple: { idToken in
            let signInWithAppleRequestDTO = SignInWithAppleRequestDTO(idToken: idToken)
            let apiEndpoint = AuthEndpoint.signInWithApple(signInWithAppleRequestDTO)
            let response = try await NetworkProvider.shared.sendRequest(apiEndpoint).toDomain()
            
            return response
        },
        signUp: { userInfo in
            let signUpRequestDTO = SignUpRequestDTO(name: userInfo.name,
                                                    gender: userInfo.gender.rawValue,
                                                    height: userInfo.height,
                                                    weight: userInfo.weight,
                                                    characterType: userInfo.characterType.rawValue,
                                                    loginType: userInfo.loginType,
                                                    oauth2Id: userInfo.oauth2Id)
            let apiEndpoint = AuthEndpoint.signUp(signUpRequestDTO)
            let response = try await NetworkProvider.shared.sendRequest(apiEndpoint).toDomain()
            
            return response
        },
        saveToken: { token in
            LocalAuthStore().saveToken(token: token)
        },
        loadToken: {
            return LocalAuthStore().loadToken()
        }
    )
}

extension DependencyValues {
    public var authClient: AuthClient {
        get { self[AuthClient.self] }
        set { self[AuthClient.self] = newValue }
    }
}
