//
//  CrewClient.swift
//  DomainCrewInterface
//
//  Created by 박현우 on 2023/07/01.
//

import Foundation
import ComposableArchitecture

public struct CrewClient {
    //FIXME: 서버 작업후 마이그레이션 예정
    public var bypassFetchCrew: @Sendable (String, String) async throws -> BypassCrewInfo
    
    public var fetchCrew: @Sendable () async throws -> [CrewInfo]
    public var makeCrew: @Sendable (String, Int) async throws -> CrewDetail
    public var joinCrew: @Sendable (String) async throws -> CrewDetail
    
    public init(
        bypassFetchCrew: @escaping @Sendable (String, String) async throws -> BypassCrewInfo,
        fetchCrew: @escaping @Sendable () async throws -> [CrewInfo],
        makeCrew: @escaping @Sendable (String, Int) async throws -> CrewDetail,
        joinCrew: @escaping @Sendable (String) async throws -> CrewDetail
    ) {
        self.bypassFetchCrew = bypassFetchCrew
        self.fetchCrew = fetchCrew
        self.makeCrew = makeCrew
        self.joinCrew = joinCrew
    }
}

extension CrewClient: TestDependencyKey {
    public static var previewValue = Self(
        bypassFetchCrew: unimplemented("\(Self.self).bypassFetchCrew"),
        fetchCrew: unimplemented("\(Self.self).fetchCrew"),
        makeCrew: unimplemented("\(Self.self).makeCrew"),
        joinCrew: unimplemented("\(Self.self).joinCrew")
    )
    
    public static let testValue = Self(
        bypassFetchCrew: unimplemented("\(Self.self).bypassFetchCrew"),
        fetchCrew: unimplemented("\(Self.self).fetchCrew"),
        makeCrew: unimplemented("\(Self.self).makeCrew"),
        joinCrew: unimplemented("\(Self.self).joinCrew")
    )
}
