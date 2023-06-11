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
                }
                .onAppear {
                    if !viewStore.isAuthorizeSuccess {
                        viewStore.send(.onAppear)
                    }
                }
                .navigationDestination(for: OnboardingScene.self) { scene in
                    switch scene {
                    case .auth :
                        IfLetStore(store.scope(state: \.auth , action: { .auth($0) })) {
                            OnboardingAuthView(store: $0)
                        }
                        
                    case .permission:
                        IfLetStore(store.scope(state: \.permission, action: { .permission($0) })) {
                            OnboardingPermissionView(store: $0)
                        }
                        
                    case .profile:
                        IfLetStore(store.scope(state: \.profile, action: { .profile($0) })) {
                            OnboardingProfileView(store: $0)
                        }
                        
                    case .avatar:
                        IfLetStore(store.scope(state: \.avatar, action: { .avatar($0) })) {
                            OnboardingAvatarView(store: $0)
                        }
                    }
                }
            }
        }
    }
}
