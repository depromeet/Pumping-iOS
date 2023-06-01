//
//  OnboardingAuthStore.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/05.
//

import Foundation

import ComposableArchitecture

public struct OnboardingAuthStore: ReducerProtocol {
    public init() {}
    
    public struct State: Equatable {
        public init() {
            
        }
    }
    
    public enum Action: Equatable {
        
    }
    
    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        
    }
}
