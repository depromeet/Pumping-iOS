//
//  OnboardingRootStore.swift
//  FeatureOnboarding
//
//  Created by 송영모 on 2023/05/11.
//

import Foundation

import ComposableArchitecture
import FeatureOnboardingInterface
import CoreKeyChainStore

extension OnboardingRootStore {
    public init() {
        
        @Dependency(\.authClient) var authClient
        
        let reducer: Reduce<State, Action> = Reduce { state, action in
            switch action {
            case .onAppear:
                // TODO: authorizationCode에서 accessToken으로 체크방식을 변경해야함 서버에 authorizationCode를 전달 후 리스폰스로 받은 JWT토큰을 키체인에 저장
                if !KeyChainStore.shared.load(property: .authorizationCode).isEmpty {
                    KeyChainStore.shared.save(property: .authorizationCode, value: "")
                    return .send(.isAlreadyAuthorized)
                }
                
                state.path.append(.auth)
                state.auth = .init()
                return .none
                
            case .auth(.signInWithApple) :
                state.isAuthorizeSuccess = true
                return .none
                
            case .auth(.moveToNextStep):
                state.path.append(.permission)
                state.permission = .init()
                return .none
                
            case .permission(.moveToNextStep):
                state.path.append(.profile)
                state.profile = .init()
                return .none
                
            case .profile(.moveToNextStep):
                state.path.append(.avatar)
                state.avatar = .init()
                return .none
                
            default :
                return .none
            }
        }
        
        self.init(
            reducer: reducer,
            onboardingAuthStore: OnboardingAuthStore(),
            onboardingPermissionStore: OnboardingPermissionStore(),
            onboadingProfileStore: OnboadingProfileStore(),
            onboardingAvatarStore: OnboardingAvatarStore()
        )
    }
}
