//
//  ProfileWeekDayCellStore.swift
//  SharedDesignSystem
//
//  Created by Derrick kim on 2023/06/14.
//

import Foundation
import ComposableArchitecture

public struct ProfileWeekDayCellStore: ReducerProtocol {
    public struct State: Equatable, Identifiable {
        public let id: UUID
        public let index: Int
        public let weekDay: String

        public var isTapped: Bool = true

        public init(id: UUID,
                    index: Int,
                    weekDay: String) {
            self.id = id
            self.index = index
            self.weekDay = weekDay
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
