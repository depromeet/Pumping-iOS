//
//  OnboardingAuthStore.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/05.
//

import Foundation
import ComposableArchitecture
import AuthenticationServices
import DomainAuthInterface

public struct OnboardingAuthStore: ReducerProtocol {
    
    @Dependency(\.authClient) public var authClient
    
    private let reducer: Reduce<State, Action>
    
    public init(reducer: Reduce<State, Action>) {
        self.reducer = reducer
    }
    
    public struct State: Equatable {
        @BindingState public var tabViewIndex : Int = 0
        
        public init() { }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        case signInWithApple(ASAuthorizationAppleIDCredential)
        case signInWithAppleError(String)
        case getUserInfo
        case getUserInfoResponse(TaskResult<UserInfo>)
        case moveToNextStep
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
    }
}
