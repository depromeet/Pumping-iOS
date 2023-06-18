//
//  WorkoutHome.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/24.
//

import Foundation

import ComposableArchitecture

import DomainWorkoutInterface
import SharedDesignSystem

public struct WorkoutHomeStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>
    
    private let pumpingTextCellStore: PumpingTextCellStore
    
    public init(
        reducer: Reduce<State, Action>,
        pumpingTextCellStore: PumpingTextCellStore
    ) {
        self.reducer = reducer
        
        self.pumpingTextCellStore = pumpingTextCellStore
    }
    
    public struct State: Equatable {
        public var workoutCategoryZip: [WorkoutCategoryIdentifierType : IdentifiedArrayOf<PumpingTextCellStore.State>] = [:]
        public var startButtonisEnabled: Bool = true
        
        public init() {
            workoutCategoryZip = [
                .whole: makeIdentifiedArray(from: .whole),
                .upper: makeIdentifiedArray(from: .upper),
                .lower: makeIdentifiedArray(from: .lower),
            ]
        }
        
        private func makeIdentifiedArray(from type: WorkoutCategoryIdentifierType) -> IdentifiedArrayOf<PumpingTextCellStore.State> {
            return .init(uniqueElements: type.identifiers.map { id in
                return .init(id: .init(), title: id.rawValue)
            })
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case startButtonTapped
        case pumpingTextCell(id: PumpingTextCellStore.State.ID, action: PumpingTextCellStore.Action)
        case goToWorkoutStart
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
    }
}
