//
//  WorkoutEnd.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/24.
//

import Foundation
import ComposableArchitecture

public struct WorkoutEndStore: ReducerProtocol {
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
        
        case completeButtonTapped
        
        case backToRoot
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
    }
}


public struct WorkoutEndView {
    public let store: StoreOf<WorkoutEndStore>
    
    public init(store: StoreOf<WorkoutEndStore>) {
        self.store = store
    }
}
