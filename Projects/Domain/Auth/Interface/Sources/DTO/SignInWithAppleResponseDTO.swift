//
//  SignInResponseDTO.swift
//  DomainAuthInterface
//
//  Created by 송영모 on 2023/05/05.
//

import Foundation

public struct SignInWithAppleResponseDTO: Codable {
    public init() { }
}

public extension SignInWithAppleResponseDTO {
    static let mock = Self()
}
