//
//  OnboardingCrewView.swift
//  FeatureOnboardingInterface
//
//  Created by 박현우 on 2023/06/02.
//

import Foundation
import SwiftUI
import ComposableArchitecture
import SharedDesignSystem

struct OnboardingCrewView: View {
    public let store: StoreOf<OnboardingCrewStore>
    
    public var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                Text("Crew View")
                
                PumpingSubmitButton(title: "Move To Root") {
                    viewStore.send(.moveToNextStep)
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}
