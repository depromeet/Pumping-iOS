//
//  WorkoutCategoryCellStore.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/06/24.
//

import Foundation

import ComposableArchitecture

import Domain

public struct WorkoutCategoryCellStore: ReducerProtocol {
    public init() { }
    
    public struct State: Equatable, Identifiable {
        public let id: UUID
        
        public var workoutCategoryIdentifier: WorkoutPart
        
        public var isTapped: Bool
        
        public init(id: UUID, workoutCategoryIdentifier: WorkoutPart, isTapped: Bool = false) {
            self.id = id
            self.workoutCategoryIdentifier = workoutCategoryIdentifier
            self.isTapped = isTapped
        }
    }
    
    public enum Action: Equatable {
        case tapped
    }
    
    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .tapped:
            return .none
        }
    }
}
