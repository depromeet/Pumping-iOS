//
//  MainStore.swift
//  Pumping
//
//  Created by 박현우 on 2023/06/07.
//

import Foundation

import ComposableArchitecture

import Feature

import Core

public struct RootStore: ReducerProtocol {

    public enum State: Equatable {
        case onboarding(OnboardingRootStore.State)
        case mainTab(MainTabViewStore.State)
        
        public init() {
//            KeyChainStore.shared.delete(property: .accessToken)
//            KeyChainStore.shared.save(property: .userId, value: "719664")
            self = .onboarding(.init())
//            self = .mainTab(.init())
        }
    }
    
    public enum Action: Equatable {
        case onboarding(OnboardingRootStore.Action)
        case mainTab(MainTabViewStore.Action)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .onboarding(.goToMain):
                state = .mainTab(.init())
                return .none
                
            case .mainTab(.profile(.home(.deleteUserResponse))):
                KeyChainStore.shared.deleteAll()
                state = .onboarding(.init())
                return .none
                
            default:
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
