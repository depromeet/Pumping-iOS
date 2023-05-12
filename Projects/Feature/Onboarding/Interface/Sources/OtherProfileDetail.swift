//
//  OtherProfileDetail.swift
//  FeatureOnboarding
//
//  Created by 송영모 on 2023/05/12.
//

import ComposableArchitecture

public struct OtherProfileDetailStore: ReducerProtocol {
    private let reduce: Reduce<State, Action>
    
    public init(reduce: Reduce<State, Action>) {
        self.reduce = reduce
    }
    
    public struct State: Equatable {
        public let index: Int
        
        public init(index: Int) {
            self.index = index
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reduce
    }
}


public struct OtherProfileDetailView {
    public let store: StoreOf<OtherProfileDetailStore>
    
    public init(store: StoreOf<OtherProfileDetailStore>) {
        self.store = store
    }
}
