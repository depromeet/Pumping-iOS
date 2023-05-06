//
//  SignOutResponse.swift
//  DomainAuthInterface
//
//  Created by 송영모 on 2023/05/05.
//

import Foundation

public struct SignOutResponse: Codable {
    public init() { }
}

public extension SignOutResponse {
    static let mock = Self()
}
