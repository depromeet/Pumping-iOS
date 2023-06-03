//
//  OnboardingStore.swift
//  Feature
//
//  Created by 박현우 on 2023/06/03.
//

import Foundation
import ComposableArchitecture
import SharedDesignSystem

public struct OnboardingStore: ReducerProtocol {
    public init() {
        
    }
    
    public struct State: Equatable {
        public var main: MainStore.State?
        
        public init() {
            
        }
    }
    
    public enum Action: Equatable {
        case main(MainStore.Action)
       
    }
    
    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case let .main(action):
                state.main = .init()
                return .none
            }
        }
        .ifLet(\.main, action: /Action.main) {
            MainStore()
        }


    }
}
