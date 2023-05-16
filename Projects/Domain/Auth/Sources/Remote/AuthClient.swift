//
//  AuthClient.swift
//  DomainAuthTesting
//
//  Created by 송영모 on 2023/05/05.
//

import Foundation

import ComposableArchitecture

import DomainAuthInterface

// TODO: mock 말고 실제 API 연동 해야함
extension AuthClient: DependencyKey {
    static public let liveValue = AuthClient(
        signUp: { _ in .mock },
        signOut: { _ in .mock }
    )
}
