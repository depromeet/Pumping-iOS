//
//  HomeRoot.swift
//  FeatureHomeInterface
//
//  Created by 송영모 on 2023/05/09.
//

import ComposableArchitecture

public enum HomeScene: Hashable {
    case home
}

public struct HomeRootStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>
    private let homeStore: HomeStore
    
    public init(
        reducer: Reduce<State, Action>,
        homeStore: HomeStore
    ) {
        self.reducer = reducer
        self.homeStore = homeStore
    }
    
    public struct State: Equatable {
        @BindingState public var path: [HomeScene] = []
        
        public var home: HomeStore.State? = .init()
        
        public init() {
            
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case home(HomeStore.Action)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
            .ifLet(\.home, action: /Action.home) {
                homeStore
            }
    }
}


public struct HomeRootView {
    public let store: StoreOf<HomeRootStore>
    
    public init(store: StoreOf<HomeRootStore>) {
        self.store = store
    }
}
