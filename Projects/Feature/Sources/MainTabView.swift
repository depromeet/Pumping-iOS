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
import FeatureWorkoutInterface
import FeatureHome
import FeatureOnboarding
import FeatureWorkout
import SharedDesignSystem

public struct MainTabView: View {
    public let store: StoreOf<MainTabViewStore>
    
    public init(store: StoreOf<MainTabViewStore>) {
        self.store = store
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
                                
                IfLetStore(self.store.scope(state: \.workout, action: { .workout($0) })) {
                    WorkoutRootView(store: $0)
                        .tabItem {
                            Image(systemName: "person")
                            Text("Workout")
                        }
                }
                
                IfLetStore(self.store.scope(state: \.profile, action: { .profile($0) })) {
                    ProfileRootView(store: $0, profileSubject: .my)
                        .tabItem {
                            Image(systemName: "person")
                            Text("MyPage")
                        }
                }
            }
        }
    }
}
