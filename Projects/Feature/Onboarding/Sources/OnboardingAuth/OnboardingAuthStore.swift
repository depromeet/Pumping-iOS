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

extension OnboardingAuthStore {
    public init() {        
        let reducer : Reduce<State, Action> = Reduce { state, action in
            switch action {
            case .binding:
                return .none
                
            case let .signInWithApple(appleIDCredential):
                authClient.setUserInfo(appleIDCredential)
                
                return .send(.moveToNextStep)
            case let .signInWithAppleError(error):
                print(error)
                return .none
            case .getUserInfo:
                return .none
//                return .task {
//                    await .getUserInfoResponse(
//                        TaskResult {
//                            try await authClient.getUserInfo()
//                        }
//                    )
//                }
            case let .getUserInfoResponse(.success(userInfo)):
                print(userInfo)
                return .none
                
            case let .getUserInfoResponse(.failure(error)):
                print(error.localizedDescription)
                return .none
            case.moveToNextStep :
                return .none
            }
        }
        
        self.init(
            reducer: reducer
        )
    }
}


//let userIdentifier = appleIDCredential.user
//let fullName = appleIDCredential.fullName
//let name =  (fullName?.familyName ?? "") + (fullName?.givenName ?? "")
//let email = appleIDCredential.email
//let identityToken = String(data: appleIDCredential.identityToken!, encoding: .utf8)
//let authorizationCode = String(data: appleIDCredential.authorizationCode!, encoding: .utf8)
//
//print("userIdentifier", userIdentifier)
//print("fullName", fullName)
//print("name", name)
//print("email", email)
//print("identityToken", identityToken)
//print("authorizationCode", authorizationCode)
