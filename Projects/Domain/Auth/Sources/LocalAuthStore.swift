//
//  LocalAuthStore.swift
//  DomainAuthInterface
//
//  Created by 박현우 on 2023/05/16.
//

import Foundation
import DomainAuthInterface
import CoreKeyChainStore

public final class LocalAuthStore : LocalAuthStoreInterface {
    public func loadToken() -> Token {
        return Token(
            accessToken: KeyChainStore.shared.load(property: .accessToken),
            expiresAt: KeyChainStore.shared.load(property: .expiresAt),
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
        
        KeyChainStore.shared.save(property: .loginType, value: token.loginType)
        KeyChainStore.shared.save(property: .oauth2Id, value: token.oauth2Id)
    }
    
}
