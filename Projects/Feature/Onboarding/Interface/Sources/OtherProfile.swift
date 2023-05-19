//
//  OtherProfile.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/11.
//

import ComposableArchitecture

public struct OtherProfileStore: ReducerProtocol {
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
        
        case tapCell(Int)
        
        case goToOtherProfileDetail(OtherProfileDetailStore.State)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
    }
}


public struct OtherProfileView {
    public let store: StoreOf<OtherProfileStore>
    
    public init(store: StoreOf<OtherProfileStore>) {
        self.store = store
    }
}
