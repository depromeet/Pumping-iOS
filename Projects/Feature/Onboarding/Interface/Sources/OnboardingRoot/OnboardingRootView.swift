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
                    IfLetStore(store.scope(state: \.auth , action: { .auth($0) })) {
                        OnboardingAuthView(store: $0)
                    }
                }
                .navigationDestination(for: OnboardingScene.self) { scene in
                    switch scene {
                    case .auth, .permission:
                        IfLetStore(store.scope(state: \.permission, action: { .permission($0) })) {
                            OnboardingPermissionView(store: $0)
                        }
                        
                    case .profile:
                        IfLetStore(store.scope(state: \.profile, action: { .profile($0) })) {
                            OnboardingProfileView(store: $0)
                        }
                        
                    case .crew:
                        IfLetStore(store.scope(state: \.crew, action: { .crew($0) })) {
                            OnboardingCrewView(store: $0)
                        }
                    }
                }
            }
        }
    }
}
