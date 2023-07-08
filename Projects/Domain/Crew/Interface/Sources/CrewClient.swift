//
//  CrewClient.swift
//  DomainCrewInterface
//
//  Created by 박현우 on 2023/07/01.
//

import Foundation
import ComposableArchitecture

public struct CrewClient {
    public var fetchCrew: @Sendable () async throws -> [CrewInfo]
    public var makeCrew: @Sendable (String, Int) async throws -> CrewDetail
    public var joinCrew: @Sendable (String) async throws -> CrewDetail
    
    public init(fetchCrew: @escaping @Sendable () async throws -> [CrewInfo],
                makeCrew: @escaping @Sendable (String, Int) async throws -> CrewDetail,
                joinCrew: @escaping @Sendable (String) async throws -> CrewDetail) {
        self.fetchCrew = fetchCrew
        self.makeCrew = makeCrew
        self.joinCrew = joinCrew
    }
}

extension CrewClient: TestDependencyKey {
    public static var previewValue = Self(
        fetchCrew: unimplemented("\(Self.self).fetchCrew"),
        makeCrew: unimplemented("\(Self.self).makeCrew"),
        joinCrew: unimplemented("\(Self.self).joinCrew")
    )
    
    public static let testValue = Self(
        fetchCrew: unimplemented("\(Self.self).fetchCrew"),
        makeCrew: unimplemented("\(Self.self).makeCrew"),
        joinCrew: unimplemented("\(Self.self).joinCrew")
    )
}
