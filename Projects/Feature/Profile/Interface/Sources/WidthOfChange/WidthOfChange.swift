//
//  WidthOfChange.swift
//  FeatureProfileInterface
//
//  Created by 송영모 on 2023/05/19.
//

import ComposableArchitecture

public struct WidthOfChangeStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>
    
    public init(reducer: Reduce<State, Action>) {
        self.reducer = reducer
    }
    
    public struct State: Equatable {
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


public struct WidthOfChangeView {
    public let store: StoreOf<WidthOfChangeStore>
    
    public init(store: StoreOf<WidthOfChangeStore>) {
        self.store = store
    }
}
