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

public struct MainStore: ReducerProtocol {

    public struct State: Equatable {
        public var onboarding: OnboardingRootStore.State?
        public var mainTab: MainTabViewStore.State?
        
        public init() { }
    }
    
    public enum Action: Equatable {
        case onAppear
        case checkIfLogin

        case onboarding(OnboardingRootStore.Action)
        case mainTab(MainTabViewStore.Action)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return EffectTask(value: .checkIfLogin)
            case .checkIfLogin:
                state.onboarding = .init()
                return .none
            case .onboarding:
                state.onboarding = .init()
                return .none
            case .mainTab:
                state.mainTab = .init()
                return .none
            }
        }
        .ifLet(\.onboarding, action: /Action.onboarding) {
            OnboardingRootStore()
        }
    }
}
