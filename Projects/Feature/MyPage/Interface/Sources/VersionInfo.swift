//
//  VersionInfo.swift
//  FeatureMyPageInterface
//
//  Created by 송영모 on 2023/05/09.
//

import ComposableArchitecture

public struct VersionInfoStore: ReducerProtocol {
    public init() {}
    
    public struct State: Equatable {
        
    }
    
    public enum Action: Equatable {
        
    }
    
    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        
    }
}

public struct VersionInfoView {
    public let store: StoreOf<VersionInfoStore>
    
    public init(store: StoreOf<VersionInfoStore>) {
        self.store = store
    }
}
