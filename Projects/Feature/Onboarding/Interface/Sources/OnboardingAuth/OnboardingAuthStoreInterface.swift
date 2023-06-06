//
//  OnboardingAuthStore.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/05.
//

import Foundation
import ComposableArchitecture
<<<<<<< HEAD:Projects/Feature/Onboarding/Interface/Sources/OnboardingAuth/OnboardingAuthStoreInterface.swift
import AuthenticationServices
=======
import Foundation
>>>>>>> develop:Projects/Feature/Onboarding/Interface/Sources/OtherProfileDetail.swift

public struct OnboardingAuthStore: ReducerProtocol {
    
    private let reducer: Reduce<State, Action>
    
    public init(reducer: Reduce<State, Action>) {
        self.reducer = reducer
    }
    
    public struct State: Equatable {
<<<<<<< HEAD:Projects/Feature/Onboarding/Interface/Sources/OnboardingAuth/OnboardingAuthStoreInterface.swift
        @BindingState public var tabViewIndex : Int = 0
        public var isAuthorized : Bool = false
        
        public init() { }
=======
        public let index: Int

        public init(index: Int) {
            self.index = index
        }
>>>>>>> develop:Projects/Feature/Onboarding/Interface/Sources/OtherProfileDetail.swift
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
<<<<<<< HEAD:Projects/Feature/Onboarding/Interface/Sources/OnboardingAuth/OnboardingAuthStoreInterface.swift
        case signInWithApple(ASAuthorizationAppleIDCredential)
        case signInWithAppleError(String)
        case moveToNextStep
=======

        case tapHeartButton
        case tapComparisonButton
>>>>>>> develop:Projects/Feature/Onboarding/Interface/Sources/OtherProfileDetail.swift
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
    }
}
