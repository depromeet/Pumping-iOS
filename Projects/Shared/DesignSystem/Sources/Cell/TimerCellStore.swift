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

        public init(id: UUID, title: String) {
            self.id = id
            self.title = title
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
