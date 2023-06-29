//
//  OnboardingAuthStore.swift
//  FeatureOnboardingInterface
//
//  Created by 박현우 on 2023/06/01.
//

import Foundation
import ComposableArchitecture
import FeatureOnboardingInterface
import DomainAuthInterface
import DomainAuth
import CoreKeyChainStore

extension OnboardingAuthStore {
    public init() {
        
        @Dependency(\.authClient) var authClient
        
        let reducer : Reduce<State, Action> = Reduce { state, action in
            switch action {
            case .checkAuthorization :
                
                if KeyChainStore.shared.validateToken() {
                    return .send(.isAlreadyAuthorized)
                }
                
                return .none
                
            case let .signInWithApple(appleIDCredential):
                guard let idTokenData = appleIDCredential.identityToken,
                      let idToken = String(data: idTokenData, encoding: .utf8) else {
                    return .none
                }
                
                return .task { [idToken = idToken] in
                    await .signInWithAppleResponse(
                        TaskResult {
                            try await authClient.signInWithApple(idToken)
                        }
                    )
                }
                                
            case let .signInWithAppleError(error):
                print(error)
                return .none
                
            case let .signInWithAppleResponse(.success(token)):
                authClient.saveToken(token)
                
                // 엑세스토큰이 만료되어 다시 애플로그인을 통해 로그인 시 엑세스토큰이 리턴되기 때문에
                // 다시 signUp을 할 필요가 없어서 메인 화면으로 보냄
                // signUp전에는 엑세스토큰이 nil로 옴
                if token.accessToken != nil {
                    return .send(.isAlreadyAuthorized)
                }
                
                return .send(.goToPermission)
                
            case let .signInWithAppleResponse(.failure(error)):
                print(error)
                return .none
                
            default :
                return .none
            }
        }
        
        self.init(
            reducer: reducer
        )
    }
}
