//
//  ProfileRootStore.swift
//  FeatureProfileInterface
//
//  Created by 송영모 on 2023/05/19.
//

import ComposableArchitecture

import FeatureProfileInterface

extension ProfileRootStore {
    public init() {
        let reducer: Reduce<State, Action> = .init { state, action in
            switch action {
            case .binding:
                return .none
                
            case .tapWidthOfChangeButton:
                state.widthOfChange = .init()
                state.path.append(.widthOfChange)
                return .none
                
            case .widthOfChange:
                return .none
            }
        }
        
        self.init(
            reducer: reducer,
            widthOfChangeStore: .init()
        )
    }
}
