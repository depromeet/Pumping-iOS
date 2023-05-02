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
        var path: NavigationPath = NavigationPath()
    }
    
    public enum Action: Equatable, Sendable {
        case pushOnboardingNicknameScreen
        case setNavigation
    }
    
    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .pushOnboardingNicknameScreen:
            state.path.append(OnboardingNicknameLink.link)
            print(state.path)
            return .none
            
        case .setNavigation:
            state.path = .init()
            return .none
        }
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
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationStack(path: viewStore.binding(get: \.path, send: OnboardingRootCore.Action.setNavigation)) {
                VStack {
                    Button(action: {
                        viewStore.send(.pushOnboardingNicknameScreen)
                    }, label: {
                        Text("go to nick name view")
                    })
                }
                .navigationDestination(for: OnboardingNicknameLink.self, destination: { _ in
                    OnboardingNicknameView(dependency: .init(path: viewStore.path))
                })
                .navigationDestination(for: OnboardingSignUpLink.self, destination: { _ in
                    Text("Sign Up")
                })
            }
        }
    }
}
