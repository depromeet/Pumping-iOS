//
//  OnboardingFirstView.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/04/30.
//

import SwiftUI
import FeatureOnboardingInterface
import ComposableArchitecture

public struct OnboardingFirstView: OnboardingScreen {
    public init() {}
    
    public var body: some View {
        NavigationStack {
            NavigationLink("Second", destination: OnboardingSecondView())
        }
    }
}

struct OnboardingFirstView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingFirstView()
    }
}
