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
        WithViewStore(store) { viewStore in
            NavigationStack(path: viewStore.binding(\.$path)) {
                OnboardingAuthView(store: self.store.scope(state: \.auth, action: { .auth($0) }))
                    .navigationDestination(for: OnboardingScene.self) { scene in
                        switch scene {
                        case .permission:
                            IfLetStore(self.store.scope(state: \.permission, action: { .permission($0) })) {
                                OnboardingPermissionView(store: $0)
                            }
                            
                        case .profile:
                            IfLetStore(self.store.scope(state: \.profile, action: { .profile($0) })) {
                                OnboardingProfileView(store: $0)
                            }
                            
                        case .avatar:
                            IfLetStore(self.store.scope(state: \.avatar, action: { .avatar($0) })) {
                                OnboardingAvatarView(selectedGender: viewStore.state.profile?.gender, store: $0)
                            }
                            
                        }
                    }
            }
        }
    }
}
