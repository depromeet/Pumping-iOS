//
//  OnboardingSignUpView.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/05.
//

import SwiftUI
import AuthenticationServices

import ComposableArchitecture

import FeatureOnboardingInterface

extension OnboardingSignUpView: View {
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                Text("Sign Up View")
                
                SignInWithAppleButton(
                    onRequest: { request in
                        request.requestedScopes = [.fullName, .email]
                    },
                    onCompletion: { result in
                        switch result {
                        case .success(let authResults):
                            switch authResults.credential{
                            case let appleIDCredential as ASAuthorizationAppleIDCredential:
                                break
                                /*TODO: 로그인 피쳐 사용시 개발
                                let userIdentifier = appleIDCredential.user
                                let fullName = appleIDCredential.fullName
                                let name =  (fullName?.familyName ?? "") + (fullName?.givenName ?? "")
                                let email = appleIDCredential.email
                                let identityToken = String(data: appleIDCredential.identityToken!, encoding: .utf8)
                                let authorizationCode = String(data: appleIDCredential.authorizationCode!, encoding: .utf8)
                                 */
                            default:
                                break
                            }
                        case .failure(let error):
                            print(error.localizedDescription)
                            print("error")
                        }
                    }
                )
                .frame(width : UIScreen.main.bounds.width * 0.9, height:50)
                .cornerRadius(5)
            }
        }
    }
}
