//
//  OnboardingCore.swift
//  FeatureOnboarding
//
//  Created by 송영모 on 2023/04/30.
//

import Foundation
import ComposableArchitecture

public struct OnboardingCore: ReducerProtocol {
    public struct State: Equatable {
        
    }
    
    public enum Action: Equatable, Sendable {
        
    }
    
    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
    }
}
