//
//  WorkoutClient.swift
//  DomainWorkoutInterface
//
//  Created by 송영모 on 2023/07/03.
//

import Foundation

import ComposableArchitecture

public struct WorkoutClient {
    public var fetchWorkout: @Sendable (String?) async throws -> ProfileWorkoutInfo
    public var makeWorkout: @Sendable ([PumpingTimer]) async throws -> String
    
    public init(
        fetchWorkout: @escaping @Sendable (String?) async throws -> ProfileWorkoutInfo,
        makeWorkout: @escaping @Sendable ([PumpingTimer]) async throws -> String) {
            self.fetchWorkout = fetchWorkout
            self.makeWorkout = makeWorkout
        }
}

extension WorkoutClient: TestDependencyKey {
    public static var previewValue = Self(
        fetchWorkout: unimplemented("\(Self.self).fetchWorkout"),
        makeWorkout: unimplemented("\(Self.self).makeWorkout")
    )
    
    public static let testValue = Self(
        fetchWorkout: unimplemented("\(Self.self).fetchWorkout"),
        makeWorkout: unimplemented("\(Self.self).makeWorkout")
    )
}
