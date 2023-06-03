//
//  OnboardingView.swift
//  Feature
//
//  Created by 박현우 on 2023/06/03.
//

import SwiftUI
import ComposableArchitecture
import SharedDesignSystem
import FeatureOnboardingInterface

public struct OnboardingView: View {
    public let store: StoreOf<OnboardingStore>
    
    public init() {
        self.store = Store(initialState: OnboardingStore.State(), reducer: OnboardingStore()._printChanges())
    }
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                
//                OnboardingRootView(store: OnboardingRootStore())
            }
        }
    }
}
