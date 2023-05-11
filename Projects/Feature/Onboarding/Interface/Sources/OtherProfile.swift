//
//  OtherProfile.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/11.
//

import ComposableArchitecture

public struct OtherProfileStore: ReducerProtocol {
    private let reduce: Reduce<State, Action>
    
    public init(reduce: Reduce<State, Action>) {
        self.reduce = reduce
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
        reduce
    }
}


public struct OtherProfileView {
    public let store: StoreOf<OtherProfileStore>
    
    public init(store: StoreOf<OtherProfileStore>) {
        self.store = store
    }
}
