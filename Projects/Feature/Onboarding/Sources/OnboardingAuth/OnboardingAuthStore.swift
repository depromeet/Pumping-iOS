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
                // TODO: authorizationCode에서 accessToken으로 체크방식을 변경해야함 서버에 authorizationCode를 전달 후 리스폰스로 받은 JWT토큰을 키체인에 저장
                if !KeyChainStore.shared.load(property: .authorizationCode).isEmpty {
                    return .send(.isAlreadyAuthorized)
                }
                
                return .none
                
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
