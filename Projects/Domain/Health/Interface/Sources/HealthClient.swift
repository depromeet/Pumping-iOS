//
//  HealthClient.swift
//  DomainHealthInterface
//
//  Created by 송영모 on 2023/06/25.
//

import Foundation

import ComposableArchitecture

public struct HealthClient {
    public var loadHeartRate: @Sendable () -> Int
   
    public init(
        loadHeartRate: @escaping @Sendable () -> Int
    ) {
        self.loadHeartRate = loadHeartRate
    }
}

extension HealthClient: TestDependencyKey {
    public static var previewValue = Self(
        loadHeartRate: unimplemented("\(Self.self).loadHeartRate")
    )
    
    public static let testValue = Self(
        loadHeartRate: unimplemented("\(Self.self).loadHeartRate")
    )
}
