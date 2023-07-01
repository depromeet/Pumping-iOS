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
   
    public init(makeCrew: @escaping @Sendable (String, Int) async throws -> CrewInfo) {
        self.makeCrew = makeCrew
    }
}

extension CrewClient: TestDependencyKey {
    public static var previewValue = Self(
        makeCrew: unimplemented("\(Self.self).makeCrew")
    )
    
    public static let testValue = Self(
        makeCrew: unimplemented("\(Self.self).makeCrew")
    )
}
