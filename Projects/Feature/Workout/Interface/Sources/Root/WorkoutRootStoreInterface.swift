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
    case record
}

public struct WorkoutRootStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>
    
    private let workoutHomeStore: WorkoutHomeStore
    private let workoutStartStore: WorkoutStartStore
    private let workoutTimerStore: WorkoutTimerStore
    private let workoutEndStore: WorkoutEndStore
    private let workoutRecordStore: WorkoutRecordStore
    
    public init(
        reducer: Reduce<State, Action>,
        workoutHomeStore: WorkoutHomeStore,
        workoutStartStore: WorkoutStartStore,
        workoutTimerStore: WorkoutTimerStore,
        workoutEndStore: WorkoutEndStore,
        workoutRecordStore: WorkoutRecordStore
    ) {
        self.reducer = reducer
        
        self.workoutHomeStore = workoutHomeStore
        self.workoutStartStore = workoutStartStore
        self.workoutTimerStore = workoutTimerStore
        self.workoutEndStore = workoutEndStore
        self.workoutRecordStore = workoutRecordStore
    }
    
    public struct State: Equatable {
        @BindingState public var path: [WorkoutScene] = []
        
        public var workoutHome: WorkoutHomeStore.State?
        public var workoutStart: WorkoutStartStore.State?
        public var workoutTimer: WorkoutTimerStore.State?
        public var workoutEnd: WorkoutEndStore.State?
        public var workoutRecord: WorkoutRecordStore.State?
        
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
        case workoutRecord(WorkoutRecordStore.Action)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
            .ifLet(\.workoutHome, action: /Action.workoutHome) {
                workoutHomeStore
            }
            .ifLet(\.workoutStart, action: /Action.workoutStart) {
                workoutStartStore
            }
            .ifLet(\.workoutTimer, action: /Action.workoutTimer) {
                workoutTimerStore
            }
            .ifLet(\.workoutEnd, action: /Action.workoutEnd) {
                workoutEndStore
            }
            .ifLet(\.workoutRecord, action: /Action.workoutRecord) {
                workoutRecordStore
            }
    }
}
