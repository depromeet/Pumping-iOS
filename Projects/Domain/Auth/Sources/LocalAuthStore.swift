//
//  LocalAuthStore.swift
//  DomainAuthInterface
//
//  Created by 박현우 on 2023/05/16.
//

import Foundation

import DomainAuthInterface
import Core

public final class LocalAuthStore : LocalAuthStoreInterface {
    public func loadToken() -> Token {
        return Token(
            accessToken: KeyChainStore.shared.load(property: .accessToken),
            expiresAt: KeyChainStore.shared.load(property: .expiresAt),
            userId: KeyChainStore.shared.load(property: .userId),
            loginType: KeyChainStore.shared.load(property: .loginType),
            oauth2Id: KeyChainStore.shared.load(property: .oauth2Id)
        )
    }
    
    public func saveToken(token : Token) {
        if let accessToken = token.accessToken {
            KeyChainStore.shared.save(property: .accessToken, value: accessToken)
        }
        
        if let expiresAt = token.expiresAt {
            KeyChainStore.shared.save(property: .expiresAt, value: expiresAt)
        }
        
        if let userId = token.userId {
            KeyChainStore.shared.save(property: .userId, value: userId)
        }
        
        if let loginType = token.loginType {
            KeyChainStore.shared.save(property: .loginType, value: loginType)
        }
        
        if let oauth2Id = token.oauth2Id {
            KeyChainStore.shared.save(property: .oauth2Id, value: oauth2Id)
        }
    }
    
}
