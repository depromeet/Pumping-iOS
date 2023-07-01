//
//  WorkoutRoot.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/23.
//

import ComposableArchitecture

public enum WorkoutScene: Hashable {
    case root
    case home
    case start
    case timer
    case end
}

public struct WorkoutRootStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>
    
    private let workoutHomeStore: WorkoutHomeStore
    private let workoutStartStore: WorkoutStartStore
    private let workoutTimerStore: WorkoutTimerStore
    private let workoutEndStore: WorkoutEndStore
    
    public init(
        reducer: Reduce<State, Action>,
        workoutHomeStore: WorkoutHomeStore,
        workoutStartStore: WorkoutStartStore,
        workoutTimerStore: WorkoutTimerStore,
        workoutEndStore: WorkoutEndStore
    ) {
        self.reducer = reducer
        
        self.workoutHomeStore = workoutHomeStore
        self.workoutStartStore = workoutStartStore
        self.workoutTimerStore = workoutTimerStore
        self.workoutEndStore = workoutEndStore
    }
    
    public struct State: Equatable {
        @BindingState public var path: [WorkoutScene] = []
        
        public var workoutHome: WorkoutHomeStore.State = .init()
        public var workoutStart: WorkoutStartStore.State?
        public var workoutTimer: WorkoutTimerStore.State?
        public var workoutEnd: WorkoutEndStore.State?
        
        public init() {
            
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case startButtonTapped
        
        case workoutHome(WorkoutHomeStore.Action)
        case workoutStart(WorkoutStartStore.Action)
        case workoutTimer(WorkoutTimerStore.Action)
        case workoutEnd(WorkoutEndStore.Action)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        
        Scope(state: \.workoutHome, action: /Action.workoutHome) {
            workoutHomeStore
        }
        
        reducer
            .ifLet(\.workoutStart, action: /Action.workoutStart) {
                workoutStartStore
            }
            .ifLet(\.workoutTimer, action: /Action.workoutTimer) {
                workoutTimerStore
            }
            .ifLet(\.workoutEnd, action: /Action.workoutEnd) {
                workoutEndStore
            }
    }
}
