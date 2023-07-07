//
//  CrewClient.swift
//  DomainCrewInterface
//
//  Created by 박현우 on 2023/07/01.
//

import Foundation
import ComposableArchitecture

public struct CrewClient {
    public var makeCrew: @Sendable (String, Int) async throws -> CrewInfo
    public var joinCrew: @Sendable (String) async throws -> CrewInfo
   
    public init(makeCrew: @escaping @Sendable (String, Int) async throws -> CrewInfo,
                joinCrew: @escaping @Sendable (String) async throws -> CrewInfo) {
        self.makeCrew = makeCrew
        self.joinCrew = joinCrew
    }
}

extension CrewClient: TestDependencyKey {
    public static var previewValue = Self(
        makeCrew: unimplemented("\(Self.self).makeCrew"),
        joinCrew: unimplemented("\(Self.self).joinCrew")
    )
    
    public static let testValue = Self(
        makeCrew: unimplemented("\(Self.self).makeCrew"),
        joinCrew: unimplemented("\(Self.self).joinCrew")
    )
}
