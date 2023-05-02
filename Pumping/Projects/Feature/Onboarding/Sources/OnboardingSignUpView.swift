//
//  OnboardingSignUpView.swift
//  FeatureOnboarding
//
//  Created by 송영모 on 2023/05/02.
//

import SwiftUI
import ComposableArchitecture

import FeatureOnboardingInterface

enum OnboardingSignUpLink: Hashable, Identifiable {
    case link

    var id: String {
        String(describing: self)
    }
}

public struct OnboardingSignUpCore: ReducerProtocol {
    public struct State: Equatable {
        var depencendy: OnboardingSignUpDependency
    }
    
    public enum Action: Equatable, Sendable {
        
    }
    
    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {

    }
}

public struct OnboardingSignUpView: OnboardingSignUpScreen {
    public var dependency: OnboardingSignUpDependency
    
    private let store: StoreOf<OnboardingSignUpCore>
    
    public init(dependency: OnboardingSignUpDependency) {
        self.dependency = dependency
        
        self.store = .init(
            initialState: .init(depencendy: dependency),
            reducer: OnboardingSignUpCore()
        )
    }
    
    public var body: some View {
        VStack {
            Text("sign up view")
        }
    }
}
