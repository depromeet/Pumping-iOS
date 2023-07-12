//
//  OnboardingRootStore.swift
//  FeatureOnboarding
//
//  Created by 송영모 on 2023/05/11.
//

import Foundation

import ComposableArchitecture
import FeatureOnboardingInterface
import Domain
import CoreKeyChainStore

extension OnboardingRootStore {
    public init() {
        @Dependency(\.authClient) var authClient
        @Dependency(\.crewClient) var crewClient
        @Dependency(\.userClient) var userClient
        
        let reducer: Reduce<State, Action> = Reduce { state, action in
            switch action {
            case .auth(.goToPermission):
                state.path.append(.permission)
                state.permission = .init()
                return .none
                
            case .auth(.isAlreadyAuthorized):
                return .send(.goToMain)
                
            case .permission(.goToProfile):
                state.path.append(.profile)
                state.profile = .init()
                return .none
                
            case .profile(.goToAvatar):
                state.path.append(.avatar)
                state.avatar = .init()
                return .none
                
            case .avatar(.signUp):
                let token = authClient.loadToken()
                
                guard let name = state.profile?.name,
                      let gender = state.profile?.gender,
                      let height = state.profile?.height,
                      let weight = state.profile?.weight,
                      let characterType = state.avatar?.pickedCharacter,
                      let loginType = token.loginType,
                      let oauth2Id = token.oauth2Id else {
                    return .none
                }
                
                let userInfo = UserInfo(
                    name: name,
                    gender: gender,
                    height: height,
                    weight: weight,
                    characterType: characterType,
                    loginType: loginType,
                    oauth2Id: oauth2Id
                )
                
                return .task { [userInfo = userInfo] in
                    await .signUp(
                        TaskResult {
                            try await authClient.signUp(userInfo)
                        }
                    )
                }
                
            case let .signUp(.success(token)):
                print(token)
                authClient.saveToken(token)
                return .send(.goToMain)
                
            case let .signUp(.failure(error)):
                print(error.localizedDescription)
                return .none
                
            case .goToMain:
                state.permission = nil
                state.profile = nil
                state.avatar = nil
                return .none
                
            default:
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
