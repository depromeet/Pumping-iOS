//
//  WorkoutEnd.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/24.
//

import Foundation

import ComposableArchitecture

import SharedDesignSystem

public struct WorkoutEndStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>
    
    public init(reducer: Reduce<State, Action>) {
        self.reducer = reducer
    }
    
    public struct State: Equatable {
        public var workoutTime: Int = 10000
        public var workoutCalorie: Int = 300
        public var workoutToolCells: IdentifiedArrayOf<PumpingTextCellStore.State> = [
            .init(id: .init(), title: "어깨"),
            .init(id: .init(), title: "등")
        ]
        
        public init() {
            
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case editButtonTapped
        case completeButtonTapped
        
        case pumpingTextCell(id: PumpingTextCellStore.State.ID, action: PumpingTextCellStore.Action)
        
        //MARK: Navigation
        case backToRoot
        case goToWorkoutRecord
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
    }
}
