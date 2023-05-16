//
//  LocalAuthStore.swift
//  DomainAuthInterface
//
//  Created by 박현우 on 2023/05/16.
//

import Foundation
import DomainAuthInterface
import CoreKeyChainStore

final class LocalAuthStore : LocalAuthStoreInterface {
    
    // DI 해야할듯 Swinject 사용?
    let tokenStore : KeyChainStore
    
    public init(tokenStore: KeyChainStore) {
        self.tokenStore = KeyChainStore()
    }
    
    func loadToken() -> Token {
        return Token(
            accessToken: tokenStore.load(property: .accessToken),
            refreshToken: tokenStore.load(property: .refreshToken),
            expiresAt: tokenStore.load(property: .expiresAt)
        )
    }
    
}
