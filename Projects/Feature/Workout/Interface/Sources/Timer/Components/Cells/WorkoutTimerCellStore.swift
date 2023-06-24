//
//  WorkoutTimerCellStore.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/06/24.
//

import Foundation

import ComposableArchitecture

import Domain

public struct WorkoutTimerCellStore: ReducerProtocol {
    public struct State: Equatable, Identifiable {
        public let id: UUID
        public let timer: PumpingTimer

        public init(id: UUID, timer: PumpingTimer) {
            self.id = id
            self.timer = timer
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
