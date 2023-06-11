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
            case let .signInWithApple(appleIDCredential):
                authClient.setUserInfo(appleIDCredential)
                
                return .send(.moveToNextStep)
                
            case let .signInWithAppleError(error):
                // TODO: error를 통해 모달이나 ViewModifier로 뷰에 노출
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
