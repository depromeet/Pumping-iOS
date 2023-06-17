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
        SwitchStore(self.store) {
            CaseLet(state: /OnboardingRootStore.State.auth, action: OnboardingRootStore.Action.auth) {
                OnboardingAuthView(store: $0)
            }
            
            CaseLet(state: /OnboardingRootStore.State.permission, action: OnboardingRootStore.Action.permission) {
                OnboardingPermissionView(store: $0)
            }
            
            CaseLet(state: /OnboardingRootStore.State.profile, action: OnboardingRootStore.Action.profile) {
                OnboardingProfileView(store: $0)
            }
            
            CaseLet(state: /OnboardingRootStore.State.avatar, action: OnboardingRootStore.Action.avatar) {
                OnboardingAvatarView(store: $0)
            }
        }
    }
}
