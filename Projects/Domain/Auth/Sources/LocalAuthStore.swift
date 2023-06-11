//
//  LocalAuthStore.swift
//  DomainAuthInterface
//
//  Created by 박현우 on 2023/05/16.
//

import Foundation
import DomainAuthInterface
import CoreKeyChainStore
import AuthenticationServices

public final class LocalAuthStore : LocalAuthStoreInterface {
    public func loadToken() -> Token {
        return Token(
            accessToken: KeyChainStore.shared.load(property: .accessToken),
            refreshToken: KeyChainStore.shared.load(property: .refreshToken),
            expiresAt: KeyChainStore.shared.load(property: .expiresAt)
        )
    }
    
    public func setUserInfo(userInfo : ASAuthorizationAppleIDCredential) {
        KeyChainStore.shared.save(property: .userIdentifier, value: userInfo.user)
        
        if let name = userInfo.fullName?.givenName {
            KeyChainStore.shared.save(property: .name, value: name)
        }
        
        if let email = userInfo.email {
            KeyChainStore.shared.save(property: .email, value: email)
        }
        
        if let identityToken = userInfo.identityToken {
            KeyChainStore.shared.save(property: .identityToken, value: String(data: identityToken, encoding: .utf8) ?? "")
        }
        
        if let authorizationCode  = userInfo.authorizationCode {
            KeyChainStore.shared.save(property: .authorizationCode, value: String(data: authorizationCode, encoding: .utf8) ?? "")
        }
    }
    
    public func getUserInfo() -> UserInfo {
        return UserInfo(userIdentifier: KeyChainStore.shared.load(property: .userIdentifier),
                        name: KeyChainStore.shared.load(property: .name),
                        email: KeyChainStore.shared.load(property: .email),
                        identityToken: KeyChainStore.shared.load(property: .identityToken),
                        authorizationCode: KeyChainStore.shared.load(property: .authorizationCode)
        )
    }
    
}
