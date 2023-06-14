//
//  ProfileBodyCellStore.swift
//  SharedDesignSystem
//
//  Created by Derrick kim on 2023/06/14.
//

import Foundation
import ComposableArchitecture

public struct ProfileBodyCellStore: ReducerProtocol {
    public struct State: Equatable, Identifiable {
        public let id: UUID
        public let ranking: String
        public let userName: String
        public let workoutTime: String

        public var isTapped: Bool = true

        public init(id: UUID,
                    ranking: String,
                    userName: String,
                    workoutTime: String) {
            self.id = id
            self.ranking = ranking
            self.userName = userName
            self.workoutTime = workoutTime
        }
    }

    public enum Action: Equatable {
    }

    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
      
    }
}
