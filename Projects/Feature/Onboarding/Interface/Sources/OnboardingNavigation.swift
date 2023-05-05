//
//  OnboardingNavigation.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/05.
//

import SwiftUI

import ComposableArchitecture

public struct OnboardingNavigation: ReducerProtocol {
    public struct State: Equatable {
        public var path = NavigationPath()
    }
    
    public enum Action: Equatable {
        case push
        case pop
    }
    
    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .push:
            return .none
            
        case .pop:
            return .none
        }
    }
}
