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
            NavigationStack(path: viewStore.binding(get: \.navigation.path, send: OnboardingRoot.Action.navigation(.pop))) {
                VStack {
                    Text("Onboarding Root View")
                    
                }
                .navigationDestination(for: OnboardingSignUp.State.self, destination: { state in
                    OnboardingSignUpView(store: .init(initialState: .init(navigation: viewStore.binding(get: \.navigation, send: OnboardingNavigation.Action)), reducer: <#T##ReducerProtocol#>))
                }
                )
            }
        }
    }
}
