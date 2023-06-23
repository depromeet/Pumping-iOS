//
//  WorkoutRecordCellStore.swift
//  SharedDesignSystem
//
//  Created by 송영모 on 2023/06/19.
//

import Foundation

import ComposableArchitecture

public struct WorkoutRecordCellStore: ReducerProtocol {
    public init() { }
    
    public struct State: Equatable, Identifiable {
        public let id: UUID
        public let title: String
        
        public var isTapped: Bool
        
        public init(id: UUID, title: String, isTapped: Bool = false) {
            self.id = id
            self.title = title
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
