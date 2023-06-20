//
//  TimerCellStore.swift
//  SharedDesignSystem
//
//  Created by 송영모 on 2023/05/26.
//

import Foundation

import ComposableArchitecture

public struct TimerCellStore: ReducerProtocol {
    public struct State: Equatable, Identifiable {
        public let id: UUID
        public let title: String
        public var second: Int
        public var isActive: Bool

        public init(id: UUID, title: String, second: Int, isActive: Bool = false) {
            self.id = id
            self.title = title
            self.second = second
            self.isActive = isActive
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
