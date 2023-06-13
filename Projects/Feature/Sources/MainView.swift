//
//  ContentView.swift
//  Feature
//
//  Created by 송영모 on 2023/04/26.
//

import SwiftUI

import ComposableArchitecture

import FeatureHomeInterface
import FeatureProfileInterface
import FeatureOnboardingInterface
import FeatureOnboarding
import SharedDesignSystem

public struct MainView: View {
    public let store: StoreOf<MainStore>
    
    public init() {
        store = .init(initialState: .init(), reducer: MainStore()._printChanges())
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            TabView {
                IfLetStore(self.store.scope(state: \.home, action: { .home($0) })) {
                    HomeRootView(store: $0)
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }
                }
                
                IfLetStore(self.store.scope(state: \.myPage, action: { .myPage($0) })) {
                    ProfileRootView(store: $0, profileSubject: .my)
                        .tabItem {
                            Image(systemName: "person")
                            Text("MyPage")
                        }
                }
                
                IfLetStore(self.store.scope(state: \.onboarding, action: { .onboarding($0) })) {
                    OnboardingRootView(store: $0)
                        .tabItem {
                            Image(systemName: "person")
                            Text("Onboarding")
                        }
                }
            }
        }
    }
}
