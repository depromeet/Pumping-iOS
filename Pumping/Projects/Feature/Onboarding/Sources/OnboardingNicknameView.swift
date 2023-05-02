//
//  OnboardingNicknameView.swift
//  FeatureOnboarding
//
//  Created by 송영모 on 2023/05/02.
//

import SwiftUI
import ComposableArchitecture

import FeatureOnboardingInterface

enum OnboardingNicknameLink: Hashable, Identifiable {
    case link

    var id: String {
        String(describing: self)
    }
}

public struct OnboardingNicknameCore: ReducerProtocol {
    public struct State: Equatable {
        var depencendy: OnboardingNicknameDependency
    }
    
    public enum Action: Equatable, Sendable {
        
    }
    
    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {

    }
}

public struct OnboardingNicknameView: OnboardingNicknameScreen {
    public var dependency: OnboardingNicknameDependency
    
    private let store: StoreOf<OnboardingNicknameCore>
    
    public init(dependency: OnboardingNicknameDependency) {
        self.dependency = dependency
        
        self.store = .init(
            initialState: .init(depencendy: dependency),
            reducer: OnboardingNicknameCore()._printChanges()
        )
    }
    
    public var body: some View {
        VStack {
            Text("nick name view")
        }
    }
}
