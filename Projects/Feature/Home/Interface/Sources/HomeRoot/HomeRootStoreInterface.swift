//
//  HomeRootStoreInterface.swift
//  FeatureHomeInterface
//
//  Created by Derrick kim on 2023/06/13.
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
