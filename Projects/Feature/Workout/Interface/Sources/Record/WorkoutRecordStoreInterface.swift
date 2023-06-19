//
//  WorkoutRecordStoreInterface.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/06/18.
//

import SwiftUI

import ComposableArchitecture

import SharedDesignSystem
import DomainAuth

public struct WorkoutRecordStore: ReducerProtocol {
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
        
        case onAppear
        
        case completeButtonTapped
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
    }
}
