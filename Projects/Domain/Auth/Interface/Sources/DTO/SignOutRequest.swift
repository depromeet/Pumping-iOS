//
//  SignOutRequest.swift
//  DomainAuthInterface
//
//  Created by 송영모 on 2023/05/05.
//

import Foundation

public struct SignOutRequest: Codable {
    public init() { }
}

public extension SignOutRequest {
    static let mock = Self()
}
