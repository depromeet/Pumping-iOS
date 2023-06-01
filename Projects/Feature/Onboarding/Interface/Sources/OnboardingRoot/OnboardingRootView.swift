//
//  OnboardingRootView.swift
//  FeatureOnboarding
//
//  Created by 송영모 on 2023/05/05.
//

import SwiftUI
import ComposableArchitecture
import SharedDesignSystem


public struct OnboardingRootView : View {
    public let store: StoreOf<OnboardingRootStore>
    
    public init(store: StoreOf<OnboardingRootStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationStack(path: viewStore.binding(\.$path)) {
                VStack {
                    Text("Root View")

                    PumpingSubmitButton(title: "계속하기", isEnable: false) {
                        print("hi")
                    }
                    
                }
                .navigationDestination(for: OnboardingScene.self) { scene in
                    switch scene {
                    case .auth:
                        IfLetStore(self.store.scope(state: \.auth, action: { .auth($0) })) {
                            OnboardingAuthView(store: $0)
                        }
                        
                    case .profile:
                        IfLetStore(self.store.scope(state: \.profile, action: { .profile($0) })) {
                            OnboardingProfileView(store: $0)
                        }
                    default:
                        EmptyView()
                    }
                }
            }
        }
    }
}
