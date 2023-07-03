//
//  WorkoutClient.swift
//  DomainWorkoutInterface
//
//  Created by 송영모 on 2023/07/03.
//

import Foundation

import ComposableArchitecture

public struct WorkoutClient {
    public var makeWorkout: @Sendable ([PumpingTimer]) async throws -> String
   
    public init(makeWorkout: @escaping @Sendable ([PumpingTimer]) async throws -> String) {
        self.makeWorkout = makeWorkout
    }
}

extension WorkoutClient: TestDependencyKey {
    public static var previewValue = Self(
        makeWorkout: unimplemented("\(Self.self).makeWorkout")
    )
    
    public static let testValue = Self(
        makeWorkout: unimplemented("\(Self.self).makeWorkout")
    )
}
