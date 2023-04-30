//
//  HomeView.swift
//  FeatureHome
//
//  Created by 송영모 on 2023/04/26.
//

import SwiftUI
import FeatureOnboardingInterface
import ComposableArchitecture

public struct OnboardingView: OnboardingScreen {
    public init() {}
    
    public var body: some View {
        NavigationStack {
            Text("OnboardingView")
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
