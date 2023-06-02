//
//  OtherProfileDetail.swift
//  FeatureOnboarding
//
//  Created by 송영모 on 2023/05/12.
//

import ComposableArchitecture
import Foundation

public struct OtherProfileDetailStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>
    
    public init(reducer: Reduce<State, Action>) {
        self.reducer = reducer
    }
    
    public struct State: Equatable {
        public let index: Int

        public init(index: Int) {
            self.index = index
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)

        case tapHeartButton
        case tapComparisonButton
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
    }
}


public struct OtherProfileDetailView {
    public let store: StoreOf<OtherProfileDetailStore>
    
    public init(store: StoreOf<OtherProfileDetailStore>) {
        self.store = store
    }
}
