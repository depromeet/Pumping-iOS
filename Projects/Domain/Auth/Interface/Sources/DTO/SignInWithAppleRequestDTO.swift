//
//  SignInRequestDTO.swift
//  DomainAuthInterface
//
//  Created by 송영모 on 2023/05/05.
//

import Foundation

public struct SignInWithAppleRequestDTO: Encodable, Equatable {
    let idToken: String
    
    public init(idToken: String) {
        self.idToken = idToken
    }
}

public extension SignInWithAppleRequestDTO {
    static let mock = Self(idToken: "ABCD-EJEO-KENLW_DKFLS")
}
