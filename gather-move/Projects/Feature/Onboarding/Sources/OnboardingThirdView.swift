//
//  OnboardingThirdView.swift
//  FeatureOnboarding
//
//  Created by 송영모 on 2023/04/30.
//

import SwiftUI
import FeatureOnboardingInterface
import ComposableArchitecture

public struct OnboardingThirdView: OnboardingScreen {
    let store: StoreOf<OnboardingCore>
    
    public init(store: StoreOf<OnboardingCore>) {
        self.store = store
    }
    
    public var body: some View {
        Text("Back To Root")
    }
}
