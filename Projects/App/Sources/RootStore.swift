//
//  MainStore.swift
//  Pumping
//
//  Created by 박현우 on 2023/06/07.
//

import Foundation

import ComposableArchitecture
import FeatureOnboardingInterface
import Feature

public struct RootStore: ReducerProtocol {

    public enum State: Equatable {
        case onboarding(OnboardingRootStore.State)
        case mainTab(MainTabViewStore.State)
        
        public init() {
            self = .onboarding(.init())
        }
    }
    
    public enum Action: Equatable {
        case onboarding(OnboardingRootStore.Action)
        case mainTab(MainTabViewStore.Action)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .onboarding(.avatar(.moveToNextStep)):
                state = .mainTab(.init())
                return .none
                
            case .onboarding(.auth(.isAlreadyAuthorized)):
                state = .mainTab(.init())
                return .none
                
            default :
                return .none
                
            }
        }
        .ifCaseLet(/State.mainTab, action: /Action.mainTab) {
            MainTabViewStore()
        }
        .ifCaseLet(/State.onboarding, action: /Action.onboarding) {
            OnboardingRootStore()
        }
    }
}
