//
//  ContentView.swift
//  Feature
//
//  Created by 송영모 on 2023/04/26.
//

import SwiftUI

import ComposableArchitecture

import FeatureCrewInterface
import FeatureProfileInterface
import FeatureOnboardingInterface
import FeatureWorkoutInterface
import FeatureCrew
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
            VStack(spacing: .zero) {
                tabView(viewStore: viewStore)
                
                tabBarView(viewStore: viewStore)
                    .frame(maxWidth: .infinity)
            }
            .ignoresSafeArea()
        }
    }
    
    @ViewBuilder
    private func tabView(viewStore: ViewStoreOf<MainTabViewStore>) -> some View {
        switch viewStore.state.currentScene {
        case .home:
            IfLetStore(self.store.scope(state: \.home, action: { .home($0) })) {
                CrewRootView(store: $0)
            }
        case .workout:
            IfLetStore(self.store.scope(state: \.workout, action: { .workout($0) })) {
                WorkoutRootView(store: $0)
            }
        case .myPage:
            IfLetStore(self.store.scope(state: \.profile, action: { .profile($0) })) {
                ProfileRootView(store: $0, profileSubject: .my)
            }
        }
    }
    
    @ViewBuilder
    private func tabBarView(viewStore: ViewStoreOf<MainTabViewStore>) -> some View {
        HStack {
            Spacer()
            
            tabBarItemView(viewStore: viewStore, scene: .home)
            
            Spacer()
            
            tabBarItemView(viewStore: viewStore, scene: .workout)
                .frame(width: 68, height: 68)
                .offset(.init(width: 0, height: -10))
            
            
            Spacer()
            
            tabBarItemView(viewStore: viewStore, scene: .myPage)
                .contentShape(Rectangle())
            
            Spacer()
        }
        .background(PumpingColors.colorGrey100.swiftUIColor)
    }
    
    @ViewBuilder
    private func tabBarItemView(
        viewStore: ViewStoreOf<MainTabViewStore>,
        scene: MainScene
    ) -> some View {
        VStack {
            Button(action: {
                viewStore.send(.selectTab(scene))
            }, label: {
                if case .workout = scene {
                    scene.image
                        .frame(width: 40, height: 40)
                } else {
                    scene.image
                        .frame(width: 28, height: 28)
                }
            })
            .overlay(
                RoundedRectangle(cornerRadius: 34)
                    .stroke(Color.white, lineWidth: 2)
            )
            
            Text(scene.title)
                .foregroundColor(PumpingColors.colorGrey600.swiftUIColor)
                .font(.pretendard(size: 12, type: .medium))
        }
        .onTapGesture {
            viewStore.send(.selectTab(scene))
        }
    }
}
