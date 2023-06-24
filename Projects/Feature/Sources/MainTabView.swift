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
                
                if viewStore.state.showTabBar {
                    tabBarView(viewStore: viewStore)
                }
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
        ZStack {
            HStack {
                Spacer()
                
                tabBarItemView(viewStore: viewStore, scene: .home)

                Spacer()
                Spacer()
                Spacer()
                
                tabBarItemView(viewStore: viewStore, scene: .myPage)
                
                Spacer()
            }
            .background(PumpingColors.colorGrey100.swiftUIColor)
            .overlay(
                Rectangle()
                    .frame(width: nil, height: 1, alignment: .top)
                    .foregroundColor(PumpingColors.colorGrey300.swiftUIColor),
                alignment: .top
            )
            
            tabBarItemView(viewStore: viewStore, scene: .workout)
                .frame(width: 68, height: 68)
                .offset(.init(width: 0, height: -20))
        }
        .frame(maxWidth: .infinity, maxHeight: 101)
    }
    
    @ViewBuilder
    private func tabBarItemView(
        viewStore: ViewStoreOf<MainTabViewStore>,
        scene: MainScene
    ) -> some View {
        VStack(spacing: .zero) {
            Button(action: {
                viewStore.send(.selectTab(scene))
            }, label: {
                if case .workout = scene {
                    scene.image
                        .renderingMode(.template)
                        .frame(width: 40, height: 40)
                        .foregroundColor(
                            viewStore.currentScene == scene ? PumpingColors.colorCyan200.swiftUIColor : PumpingColors.colorGrey900.swiftUIColor
                        )
                        .background(
                            Circle()
                                .fill(PumpingColors.colorGrey100.swiftUIColor)
                                .frame(width: 68, height: 68)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 34)
                                .stroke(PumpingColors.colorGrey300.swiftUIColor, lineWidth: 1)
                                .frame(width: 68, height: 68)
                        )
                } else {
                    scene.image
                        .renderingMode(.template)
                        .frame(width: 28, height: 28)
                        .foregroundColor(
                            viewStore.currentScene == scene ? PumpingColors.colorCyan200.swiftUIColor : PumpingColors.colorGrey900.swiftUIColor
                        )
                }
            })
            .padding(.top, 18)
            
            Text(scene.title)
                .foregroundColor(
                    viewStore.currentScene == scene ? PumpingColors.colorCyan200.swiftUIColor : PumpingColors.colorGrey600.swiftUIColor
                )
                .font(.pretendard(size: 12, type: .medium))
                .padding(.top, scene == .workout ? 28 : 5)
        }
        .onTapGesture {
            viewStore.send(.selectTab(scene))
        }
    }
}
