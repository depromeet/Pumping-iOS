//
//  ProfileRoot.swift
//  FeatureProfileInterface
//
//  Created by 송영모 on 2023/05/19.
//

import ComposableArchitecture

public enum ProfileScene: Hashable {
    case root
}

public struct ProfileRootStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>
    
    public init(
        reducer: Reduce<State, Action>
    ) {
        self.reducer = reducer
    }
    
    public struct State: Equatable {
        @BindingState public var path: [ProfileScene] = []
        
        public init() {
            
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
    }
}


public struct ProfileRootView {
    public let store: StoreOf<ProfileRootStore>
    
    public init(store: StoreOf<ProfileRootStore>) {
        self.store = store
    }
}
