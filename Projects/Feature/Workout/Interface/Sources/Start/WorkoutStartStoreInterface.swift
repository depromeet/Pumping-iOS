//
//  WorkoutStart.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/23.
//

import Foundation
import ComposableArchitecture

public struct WorkoutStartStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>
    
    public init(reducer: Reduce<State, Action>) {
        self.reducer = reducer
    }
    
    public struct State: Equatable {
        public init() {

        }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case startButtonTapped
        
        case goToWorkoutTimer
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
    }
}
