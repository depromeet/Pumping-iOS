//
//  LocalAuthStoreInterface.swift
//  DomainAuthInterface
//
//  Created by 박현우 on 2023/05/16.
//

import Foundation

public protocol LocalAuthStoreInterface {
    func loadToken() -> Token
}
