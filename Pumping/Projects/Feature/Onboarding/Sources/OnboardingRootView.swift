//
//  OnboardingRootView.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/02.
//

import SwiftUI
import ComposableArchitecture

import FeatureOnboardingInterface

public struct OnboardingRootCore: ReducerProtocol {
    public struct State: Equatable {

    }
    
    public enum Action: Equatable, Sendable {
        
    }
    
    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {

    }
}

public struct OnboardingRootView: OnboardingRootScreen {
    public var store: StoreOf<OnboardingRootCore>

    public init() {
        self.store = .init(
            initialState: .init(),
            reducer: OnboardingRootCore()._printChanges()
        )
    }

    public var body: some View {
        VStack {
            Text("dd")
        }
    }
}
