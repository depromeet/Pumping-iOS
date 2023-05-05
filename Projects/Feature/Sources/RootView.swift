//
//  ContentView.swift
//  Feature
//
//  Created by 송영모 on 2023/04/26.
//

import SwiftUI
import FeatureHome
import FeatureMyPage
import FeatureOnboarding

public struct RootView: View {
    public init() {}
    
    public var body: some View {
        OnboardingRootView()
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
