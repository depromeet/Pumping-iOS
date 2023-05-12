//
//  OnboardingRootView.swift
//  FeatureOnboarding
//
//  Created by 송영모 on 2023/05/05.
//

import SwiftUI

import ComposableArchitecture

import FeatureOnboardingInterface

extension OnboardingRootView: View {
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationStack(path: viewStore.binding(\.$path)) {
                VStack {
                    Text("Root View")
                    
                    Button("nickname") {
                        viewStore.send(.tapNicknameButton)
                    }
                    
                    Button("other profile") {
                        viewStore.send(.tapOtherProfileButton)
                    }
                }
                .navigationDestination(for: OnboardingScene.self) { scene in
                    switch scene {
                    case .nickname:
                        IfLetStore(self.store.scope(state: \.nickname, action: { .nickname($0) })) {
                            OnboardingNicknameView(store: $0)
                        }
                        
                    case .signUp:
                        IfLetStore(self.store.scope(state: \.signUp, action: { .signUp($0) })) {
                            OnboardingSignUpView(store: $0)
                        }
                        
                    case .otherProfile:
                        IfLetStore(self.store.scope(state: \.otherProfile, action: { .otherProfile($0) })) {
                            OtherProfileView(store: $0)
                        }
                        
                    case .otherProfileDetail:
                        IfLetStore(self.store.scope(state: \.otherProfileDetail, action: { .otherProfileDetail($0) })) {
                            OtherProfileDetailView(store: $0)
                        }
                        
                    default:
                        EmptyView()
                    }
                }
            }
        }
    }
}
