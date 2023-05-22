//
//  ProfileRoot.swift
//  FeatureProfileInterface
//
//  Created by 송영모 on 2023/05/19.
//

import ComposableArchitecture

public enum ProfileScene: Hashable {
    case root
    case widthOfChange
}

public struct ProfileRootStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>
    private let widthOfChangeStore: WidthOfChangeStore
    
    public init(
        reducer: Reduce<State, Action>,
        widthOfChangeStore: WidthOfChangeStore
    ) {
        self.reducer = reducer
        self.widthOfChangeStore = widthOfChangeStore
    }
    
    public struct State: Equatable {
        @BindingState public var path: [ProfileScene] = []
        
        public var widthOfChange: WidthOfChangeStore.State?
        
        public init() {
            
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case tapWidthOfChangeButton
        
        case widthOfChange(WidthOfChangeStore.Action)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
            .ifLet(\.widthOfChange, action: /Action.widthOfChange) {
                widthOfChangeStore
            }
    }
}


public struct ProfileRootView {
    public let store: StoreOf<ProfileRootStore>
    
    public init(store: StoreOf<ProfileRootStore>) {
        self.store = store
    }
}
