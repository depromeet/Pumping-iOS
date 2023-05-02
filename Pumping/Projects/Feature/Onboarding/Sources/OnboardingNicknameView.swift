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
        
        var nickname: String = ""
    }
    
    public enum Action: Equatable, Sendable {
        case nicknameChanged(String)
        
        case pushSignUpScreen
    }
    
    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case let .nicknameChanged(nickname):
            state.nickname = nickname
            return .none
            
        case .pushSignUpScreen:
            state.depencendy.path.append(OnboardingSignUpLink.link)
            return .none
        }
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
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                HStack() {
                    TextField(
                        "Nick name",
                        text: viewStore.binding(get: \.nickname, send: OnboardingNicknameCore.Action.nicknameChanged)
                    )
                    .padding()
                }
                .font(.headline)
                
                Button(action: {
                    viewStore.send(.pushSignUpScreen)
                }, label: {
                    Text("go to nick name view")
                })
            }
        }
    }
}
