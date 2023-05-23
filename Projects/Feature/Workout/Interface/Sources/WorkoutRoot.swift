//
//  WorkoutRoot.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/23.
//

import ComposableArchitecture

public enum WorkoutScene: Hashable {
    case root
    case workoutHome
    case workoutStart
    case workoutTimer
    case workoutEnd
}

public struct WorkoutRootStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>
    
    private let workoutStartStore: WorkoutStartStore
    private let workoutHomeStore: WorkoutHomeStore
    
    public init(
        reducer: Reduce<State, Action>,
        workoutStartStore: WorkoutStartStore,
        workoutHomeStore: WorkoutHomeStore
    ) {
        self.reducer = reducer
        self.workoutStartStore = workoutStartStore
        self.workoutHomeStore = workoutHomeStore
    }
    
    public struct State: Equatable {
        @BindingState public var path: [WorkoutScene] = []
        
        public var workoutHome: WorkoutHomeStore.State?
        public var workoutStart: WorkoutStartStore.State?
        
        public init() {
            
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case startButtonTapped
        
        case workoutHome(WorkoutHomeStore.Action)
        case workoutStart(WorkoutStartStore.Action)
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
    }
}


public struct WorkoutRootView {
    public let store: StoreOf<WorkoutRootStore>
    
    public init(store: StoreOf<WorkoutRootStore>) {
        self.store = store
    }
}
