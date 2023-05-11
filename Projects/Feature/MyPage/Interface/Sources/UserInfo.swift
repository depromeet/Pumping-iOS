//
//  UserInfo.swift
//  FeatureMyPageInterface
//
//  Created by 송영모 on 2023/05/09.
//

import ComposableArchitecture

public struct UserInfoStore: ReducerProtocol {
    public init() {}
    
    public struct State: Equatable {
        
    }
    
    public enum Action: Equatable {
        
    }
    
    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        
    }
}

public struct UserInfoView {
    public let store: StoreOf<UserInfoStore>
    
    public init(store: StoreOf<UserInfoStore>) {
        self.store = store
    }
}
