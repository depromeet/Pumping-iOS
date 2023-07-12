//
//  PersonalRecordCellStore.swift
//  SharedDesignSystem
//
//  Created by Derrick kim on 2023/06/14.
//

import Foundation
import ComposableArchitecture

public struct PersonalRecordCellStore: ReducerProtocol {
    public init() { }

    public struct State: Equatable, Identifiable {
        public let id: UUID
        public let userId: String
        public let avatarName: String
        public let ranking: String
        public let userName: String
        public let numberOfExerciseGoals: String
        public let workoutTime: String

        public var isTapped: Bool = true

        public init(id: UUID,
                    userId: String,
                    avatarName: String,
                    ranking: String,
                    userName: String,
                    numberOfExerciseGoals: String,
                    workoutTime: String) {
            self.id = id
            self.userId = userId
            self.avatarName = avatarName
            self.ranking = ranking
            self.userName = userName
            self.numberOfExerciseGoals = numberOfExerciseGoals
            self.workoutTime = workoutTime
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
