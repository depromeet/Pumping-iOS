//
//  SignInRequestDTO.swift
//  DomainAuthInterface
//
//  Created by 송영모 on 2023/05/05.
//

import Foundation

public struct SignInWithAppleRequestDTO: Decodable {
    public init() { }
}

public extension SignInWithAppleRequestDTO {
    static let mock = Self()
}
