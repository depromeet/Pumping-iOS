//
//  PumpintTextCellStore.swift
//  SharedDesignSystem
//
//  Created by 송영모 on 2023/05/26.
//

import Foundation

import ComposableArchitecture

struct PumpingTextCellStore: ReducerProtocol {
    struct State: Equatable, Identifiable {
        let id: UUID
    }
    
    enum Action: Equatable {
        case tapped
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .tapped:
            return .none
        }
    }
}
