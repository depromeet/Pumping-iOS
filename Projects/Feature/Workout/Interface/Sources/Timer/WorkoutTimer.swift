//
//  WorkoutTimer.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/24.
//

import Foundation
import ComposableArchitecture

import SharedDesignSystem

public struct WorkoutTimerStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>
    
    public init(reducer: Reduce<State, Action>) {
        self.reducer = reducer
    }
    
    public struct State: Equatable {
        public var timerCells: IdentifiedArrayOf<TimerCellStore.State> = [
            .init(id: .init(), title: "어깨"),
            .init(id: .init(), title: "가슴"),
            .init(id: .init(), title: "팔"),
            .init(id: .init(), title: "등"),
        ]
        
        public init() {
            
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case endButtonTapped
        case timerCell(id: TimerCellStore.State.ID, action: TimerCellStore.Action)
        
        case goToWorkoutEnd
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
    }
}


public struct WorkoutTimerView {
    public let store: StoreOf<WorkoutTimerStore>
    
    public init(store: StoreOf<WorkoutTimerStore>) {
        self.store = store
    }
}
