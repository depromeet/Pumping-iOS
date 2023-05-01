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
    @State var path = NavigationPath()
    
    public init() {}
    
    public var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Text("First View \(path.count)")
                    .padding()
                
                Button(action: {
                    path.append("second")
                }, label: {
                    Text("Next")
                })
            }
            .navigationDestination(for: String.self, destination: { _ in
                OnboardingSecondView(path: $path)
            })
        }
    }
}
