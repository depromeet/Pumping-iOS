//
//  OnboardingRootView.swift
//  FeatureOnboarding
//
//  Created by 송영모 on 2023/05/05.
//

import SwiftUI

import ComposableArchitecture

import FeatureOnboardingInterface

extension OnboardingRootView: View {
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationStack(
                path: viewStore.binding(
                    get: \.path,
                    send: OnboardingRoot.Action.navigationPathChanged
                )
            ) {
                VStack {
                    Text("Root View")
                    Button("Go To Nickname") {
                        viewStore.send(.goToNickname)
                    }
                }
                .navigationDestination(
                    for: OnboardingDestination.self
                ) { destination in
                    switch destination {
                    case .nickname:
                        OnboardingNicknameView(store: .init(initialState: .init(path: viewStore.$path), reducer: OnboardingNickname()._printChanges()))
                    case .signUp:
                        OnboardingSignUpView(store: .init(initialState: .init(), reducer: OnboardingSignUp()._printChanges()))
                    }
                }
            }
        }
    }
}
