//
//  WorkoutStart.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/23.
//

import Foundation

import ComposableArchitecture

import Domain

public struct WorkoutStartStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>
    
    public init(reducer: Reduce<State, Action>) {
        self.reducer = reducer
    }
    
    public struct State: Equatable {
        public weak var watchConnectivityDelegate: WorkoutStartWatchConnectivityDelegate?
        
        public let selectedWorkoutCategoryIdentifiers: [WorkoutCategoryIdentifier]
        
        public init(selectedWorkoutCategoryIdentifiers: [WorkoutCategoryIdentifier]) {
            self.selectedWorkoutCategoryIdentifiers = selectedWorkoutCategoryIdentifiers
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case setWatchConnectivityDelegate(WorkoutStartWatchConnectivityDelegate)
        case startButtonTapped
        
        case goToWorkoutTimer([WorkoutCategoryIdentifier])
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
    }
}
