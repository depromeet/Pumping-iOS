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
    
    public init(reducer: Reduce<State, Action>) {
        self.reducer = reducer
    }
    
    public struct State: Equatable {
        public var workoutCategoryCellZip: [WorkoutCategoryIdentifierType : IdentifiedArrayOf<WorkoutCategoryCellStore.State>] = [:]
        
        public var selectedWorkoutCategoryIdentifiers: [WorkoutCategoryIdentifier] = []
        
        public init() {
            workoutCategoryCellZip = [
                .whole: makeIdentifiedArray(from: .whole),
                .upper: makeIdentifiedArray(from: .upper),
                .lower: makeIdentifiedArray(from: .lower),
            ]
        }
        
        private func makeIdentifiedArray(from type: WorkoutCategoryIdentifierType) -> IdentifiedArrayOf<WorkoutCategoryCellStore.State> {
            return .init(uniqueElements: type.identifiers.map { id in
                return .init(id: .init(), workoutCategoryIdentifier: id)
            })
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case startButtonTapped
        case workoutCategoryCell(id: WorkoutCategoryCellStore.State.ID, action: WorkoutCategoryCellStore.Action)
        case goToWorkoutStart([WorkoutCategoryIdentifier])
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
    }
}
