//
//  RootView.swift
//  Pumping
//
//  Created by 박현우 on 2023/06/07.
//

import SwiftUI
import ComposableArchitecture
import FeatureOnboardingInterface
import Feature

struct RootView: View {
    public let store: StoreOf<RootStore>
    
    public init(store: StoreOf<RootStore>) {
        self.store = store
    }
    
    var body: some View {
        SwitchStore(self.store) {
            CaseLet(state: /RootStore.State.onboarding, action: RootStore.Action.onboarding) {
                OnboardingRootView(store: $0)
            }
            
            CaseLet(state: /RootStore.State.mainTab, action: RootStore.Action.mainTab) {
                MainTabView(store: $0)
            }
        }
    }
}
