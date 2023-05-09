//
//  ContentView.swift
//  Feature
//
//  Created by 송영모 on 2023/04/26.
//

import SwiftUI

import ComposableArchitecture

import FeatureOnboardingInterface
import FeatureOnboarding

public enum RootScene: Hashable {
    case root
    case nickname
    case signUp
}

public struct RootStore: ReducerProtocol {
    public init() {}
    
    public struct State: Equatable {
        @BindingState public var path: [RootScene] = []
        
        public init() {
            
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case onboarding(OnboardingRootStore.Action)
        case 
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
                
            case .onboarding:
                return .none
            }
        }
    }
}


public struct RootView: View {
    public init() {}
    
    public var body: some View {
        OnboardingRootView(store: .init(initialState: .init(), reducer: OnboardingRootStore()._printChanges()))
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
