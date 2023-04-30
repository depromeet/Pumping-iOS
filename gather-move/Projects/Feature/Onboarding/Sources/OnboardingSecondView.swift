//
//  OnboardingSecondView.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/04/30.
//

import SwiftUI
import FeatureOnboardingInterface
import ComposableArchitecture

public struct OnboardingSecondView: OnboardingScreen {
    
    public init() {
        
    }
    
    public var body: some View {
        NavigationLink("Third", destination: OnboardingThirdView(store: .init(initialState: .init(), reducer: OnboardingCore()._printChanges())))
    }
}

struct OnboardingSecondView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingSecondView()
    }
}
