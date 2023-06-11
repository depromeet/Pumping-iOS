//
//  RootStore.swift
//  Feature
//
//  Created by 박현우 on 2023/06/02.
//

import Foundation
import ComposableArchitecture
import FeatureHomeInterface
import FeatureProfileInterface
import FeatureOnboardingInterface
import FeatureHome
import FeatureProfile
import FeatureOnboarding
import SharedDesignSystem

public struct MainStore: ReducerProtocol {
    public init() {
        SharedDesignSystemFontFamily.registerAllCustomFonts()
    }
    
    public struct State: Equatable {
        @BindingState public var path: [MainScene] = [] //TODO: 필요성 생각하기
        
        public var home: HomeRootStore.State? = .init()
        public var myPage: ProfileRootStore.State? = .init()
        public var onboarding: OnboardingRootStore.State? = .init()
        
        public init() { }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case home(HomeRootStore.Action)
        case myPage(ProfileRootStore.Action)
        case onboarding(OnboardingRootStore.Action)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
                
            case .home:
                return .none
                
            case .myPage:
                return .none
                
            case .onboarding:
                return .none
            }
        }
        .ifLet(\.home, action: /Action.home) {
            HomeRootStore()
        }
        .ifLet(\.myPage, action: /Action.myPage) {
            ProfileRootStore()
        }
        .ifLet(\.onboarding, action: /Action.onboarding) {
            OnboardingRootStore()
        }

    }
}
