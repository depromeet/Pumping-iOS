//
//  WidthOfChangeStore.swift
//  FeatureMyPage
//
//  Created by Derrick kim on 2023/06/05.
//

import ComposableArchitecture
import FeatureProfileInterface

extension WidthOfChangeStore {
    public init() {
        let reducer: Reduce<State, Action> = .init { state, action in
            switch action {
                
            }
        }

        self.init(reducer: reducer)
    }
}
