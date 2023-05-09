//
//  MyPageRoot.swift
//  FeatureMyPageInterface
//
//  Created by 송영모 on 2023/05/09.
//

import ComposableArchitecture

public enum MyPageScene: Hashable {
    case root
    case userInfo
}

public struct MyPageRootStore: ReducerProtocol {
    public init() {}
    
    public struct State: Equatable {
        @BindingState public var path: [MyPageScene] = []
        
        public var userInfo: UserInfoStore.State?
        
        public init() {
            
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case tapUserInfoButton
        
        case binding(BindingAction<State>)
        case userInfo(UserInfoStore.Action)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .tapUserInfoButton:
                state.path = [.userInfo]
                state.userInfo = .init()
                return .none
                
            case .binding:
                return .none
            }
        }
    }
}


public struct MyPageRootView {
    public let store: StoreOf<MyPageRootStore>
    
    public init(store: StoreOf<MyPageRootStore>) {
        self.store = store
    }
}
