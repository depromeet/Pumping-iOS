//
//  OnboardingNicknameView.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/05.
//

import Foundation

import ComposableArchitecture

public struct OnboardingNicknameStore: ReducerProtocol {
    public init() {}
    
    public struct State: Equatable {
        public init() {}
    }
    
    public enum Action: Equatable {
        case tapNextButton
    }
    
    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .tapNextButton:
            return .none
        }
    }
}

public struct OnboardingNicknameView {
    public let store: StoreOf<OnboardingNicknameStore>
    
    public init(store: StoreOf<OnboardingNicknameStore>) {
        self.store = store
    }
}
