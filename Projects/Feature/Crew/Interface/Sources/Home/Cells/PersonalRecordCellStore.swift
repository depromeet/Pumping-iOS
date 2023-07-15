//
//  PersonalRecordCellStore.swift
//  SharedDesignSystem
//
//  Created by Derrick kim on 2023/06/14.
//

import Foundation
import ComposableArchitecture
import Domain

public struct PersonalRecordCellStore: ReducerProtocol {
    public init() { }

    public struct State: Equatable, Identifiable {
        public let id: UUID
        public let userId: String
        public let characterType: CharacterType
        public let ranking: String
        public let userName: String
        public let numberOfExerciseGoals: String
        public let workoutTime: String

        public var isTapped: Bool = true

        public init(id: UUID,
                    userId: String,
                    characterType: CharacterType,
                    ranking: String,
                    userName: String,
                    numberOfExerciseGoals: String,
                    workoutTime: String) {
            self.id = id
            self.userId = userId
            self.characterType = characterType
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
