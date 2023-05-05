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
            VStack {
                Text("Onboarding Root View")
            }
        }
    }
}
