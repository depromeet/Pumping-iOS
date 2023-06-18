//
//  WorkoutCounterStore.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/06/06.
//

import Foundation
import ComposableArchitecture

import FeatureWorkoutInterface
import DomainAuthInterface

extension WorkoutCounterStore {
    public init() {
        @Dependency(\.continuousClock) var clock

        let reducer: Reduce<State, Action> = .init { state, action in
            switch action {
            case .binding:
                return .none
                
            case .onAppear:
                return .run { [count = state.count] send in
                    guard count > 0 else { return }
                    
                    for await _ in clock.timer(interval: .seconds(1)) {
                        await send(.ticked)
                    }
                }
                .cancellable(id: CounterID.self, cancelInFlight: true)
                
            case .ticked:
                state.count -= 1
                if state.count < 1 {
                    return .concatenate([
                        .cancel(id: CounterID.self),
                        .send(.dismiss(state.id))
                    ])
                }
                return .none
                
            case .dismiss:
                return .none
            }
        }
        
        self.init(
            reducer: reducer
        )
    }
}
