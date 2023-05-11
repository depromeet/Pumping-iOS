//
//  ContentView.swift
//  Feature
//
//  Created by 송영모 on 2023/04/26.
//

import SwiftUI

import ComposableArchitecture

import FeatureHomeInterface
import FeatureMyPageInterface
import FeatureOnboardingInterface
import FeatureHome
import FeatureMyPage
import FeatureOnboarding

public enum RootScene: Hashable {
    case root
    case home
    case myPage
    case onboarding
}

public struct RootStore: ReducerProtocol {
    public init() {}
    
    public struct State: Equatable {
        @BindingState public var path: [RootScene] = [] //TODO: 필요성 생각하기
        
        public var home: HomeRootStore.State? = .init()
        public var myPage: MyPageRootStore.State? = .init()
        public var onboarding: OnboardingRootStore.State? = .init()
        
        public init() {
            
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case home(HomeRootStore.Action)
        case myPage(MyPageRootStore.Action)
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
            MyPageRootStore()
        }
        .ifLet(\.onboarding, action: /Action.onboarding) {
            OnboardingRootStore()
        }
    }
}


public struct RootView: View {
    public let store: StoreOf<RootStore>
    
    public init() {
        store = .init(initialState: .init(), reducer: RootStore()._printChanges())
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            TabView {
                IfLetStore(self.store.scope(state: \.home, action: { .home($0) })) {
                    HomeRootView(store: $0)
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }
                }
                
                IfLetStore(self.store.scope(state: \.myPage, action: { .myPage($0) })) {
                    MyPageRootView(store: $0)
                        .tabItem {
                            Image(systemName: "person")
                            Text("MyPage")
                        }
                }
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
