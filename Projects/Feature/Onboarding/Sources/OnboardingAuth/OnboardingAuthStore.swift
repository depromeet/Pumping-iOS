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
            case .binding:
                return .none
                
            case .checkAuthorization:
                if !KeyChainStore.shared.load(property: .accessToken).isEmpty {
                    return .send(.isAlreadyAuthorized)
                }
                
                return.none
                
            case .isAlreadyAuthorized:
                return .none
                
            case let .signInWithApple(appleIDCredential):
                
                authClient.setUserInfo(appleIDCredential)
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
