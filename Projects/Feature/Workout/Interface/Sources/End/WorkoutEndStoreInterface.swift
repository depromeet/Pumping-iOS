//
//  WorkoutEnd.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/24.
//

import Foundation
import ComposableArchitecture
import Domain

public struct WorkoutEndStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>
    
    public init(reducer: Reduce<State, Action>) {
        self.reducer = reducer
    }
    
    public struct State: Equatable {
        public var timers: [PumpingTimer] = []
        public var timerSummaryCells: IdentifiedArrayOf<WorkoutTimerSummaryCellStore.State> = []
        public var totalTime: Int = 0
        public var totalCalorie: Int = 0
        
        public init(timers: [PumpingTimer]) {
            self.timers = timers
            self.timerSummaryCells = makeTimerSummaryCells(from: timers)
            self.totalTime = timers.map(\.time).reduce(0, +)
            self.totalCalorie = Int(timers.map(\.calorie).reduce(0, +))
        }
        
        private func makeTimerSummaryCells(from timers: [PumpingTimer]) -> IdentifiedArrayOf<WorkoutTimerSummaryCellStore.State> {
            return .init(uniqueElements: timers.map { timer in
                return .init(id: .init(), timer: timer)
            })
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case completeButtonTapped
        
        case makeWorkoutRequest(timer: [PumpingTimer])
        case makeWorkoutResponse(id: TaskResult<String>)
        
        case timerSummaryCells(id: WorkoutTimerSummaryCellStore.State.ID, action: WorkoutTimerSummaryCellStore.Action)
        
        //MARK: navigation
        case backToRoot
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
    }
}
