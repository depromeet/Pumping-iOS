//
//  MainView.swift
//  Pumping
//
//  Created by 박현우 on 2023/06/07.
//

import SwiftUI
import ComposableArchitecture
import FeatureOnboardingInterface
import Feature

struct MainView: View {
    public let store: StoreOf<MainStore>
    
    public init(store: StoreOf<MainStore>) {
        self.store = store
    }
    
    var body: some View {

        WithViewStore(store) { viewStore in
            VStack {
                IfLetStore(self.store.scope(state: \.onboarding, action: { .onboarding($0) })) {
                    OnboardingRootView(store: $0)
                }

                IfLetStore(self.store.scope(state: \.mainTab, action: { .mainTab($0) })) {
                    MainTabView(store: $0)
                }
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}
