//
//  HomeRootStore.swift
//  FeatureHomeInterface
//
//  Created by Derrick kim on 2023/06/13.
//

import ComposableArchitecture
import FeatureHomeInterface

extension HomeRootStore {
    public init() {
        let reducer: Reduce<State, Action> = .init { state, action in
            switch action {
            case .binding:
                return .none
                
            case .home:
                return .none
            }
        }
        
        self.init(
            reducer: reducer,
            homeStore: .init()
        )
    }
}
