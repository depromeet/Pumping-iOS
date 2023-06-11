//
//  WorkoutCounterStoreInterface.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/06/06.
//

import SwiftUI

import Foundation
import ComposableArchitecture

import SharedDesignSystem
import DomainAuth

public struct WorkoutCounterStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>
    
    public init(reducer: Reduce<State, Action>) {
        self.reducer = reducer
    }
    
    public struct State: Equatable {
        public var count: Int = 3
        
        public init() {
            
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case onAppear
        
        case ticked
        
        case dismiss
    }
    
    public enum CounterID {}
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
    }
}
