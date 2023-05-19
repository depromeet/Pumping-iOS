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
    
    public init(reducer: Reduce<State, Action>) {
        self.reducer = reducer
    }
    
    public struct State: Equatable {
        @BindingState public var path: [HomeScene] = []
        
        public init() {
            
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
            }
        }
    }
}


public struct HomeRootView {
    public let store: StoreOf<HomeRootStore>
    
    public init(store: StoreOf<HomeRootStore>) {
        self.store = store
    }
}
