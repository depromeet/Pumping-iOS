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
    @Binding var path: NavigationPath
    
    public init(path: Binding<NavigationPath>) {
        _path = path
    }
    
    public var body: some View {
        VStack {
            Text("Second View \(path.count)")
                .padding()
            
            Button(action: {
                self.path.append(1)
            }, label: {
                Text("Next")
            })
            .padding()
            
            Button(action: {
                self.path.removeLast()
            }, label: {
                Text("prev")
            })
            .padding()
        }
        .navigationDestination(for: Int.self, destination: { _ in
            OnboardingThirdView(path: $path)
        })
    }
}
