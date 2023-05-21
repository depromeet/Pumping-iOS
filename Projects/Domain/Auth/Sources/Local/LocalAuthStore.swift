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
    
    func loadToken() -> Token {
        return Token(
            accessToken: KeyChainStore.shared.load(property: .accessToken),
            refreshToken: KeyChainStore.shared.load(property: .refreshToken),
            expiresAt: KeyChainStore.shared.load(property: .expiresAt)
        )
    }
    
}
