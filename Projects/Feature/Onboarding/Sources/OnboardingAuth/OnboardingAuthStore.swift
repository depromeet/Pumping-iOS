//
//  OnboardingAuthStore.swift
//  FeatureOnboardingInterface
//
//  Created by 박현우 on 2023/06/01.
//

import Foundation
import ComposableArchitecture
import FeatureOnboardingInterface

extension OnboardingAuthStore {
    public init() {
        let reducer : Reduce<State, Action> = Reduce { state, action in
            switch action {
            case .binding:
                return .none
                
            case let .signInWithApple(appleIDCredential):
                let userIdentifier = appleIDCredential.user
                let fullName = appleIDCredential.fullName
                let name =  (fullName?.familyName ?? "") + (fullName?.givenName ?? "")
                let email = appleIDCredential.email
                let identityToken = String(data: appleIDCredential.identityToken!, encoding: .utf8)
                let authorizationCode = String(data: appleIDCredential.authorizationCode!, encoding: .utf8)
                
                print("userIdentifier", userIdentifier)
                print("fullName", fullName)
                print("name", name)
                print("email", email)
                print("identityToken", identityToken)
                print("authorizationCode", authorizationCode)
                return .send(.moveToNextStep)
                
            case let .signInWithAppleError(error):
                print(error)
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
