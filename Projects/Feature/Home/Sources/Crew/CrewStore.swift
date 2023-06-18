//
//  CrewStore.swift
//  FeatureHomeInterface
//
//  Created by Derrick kim on 2023/06/15.
//

import ComposableArchitecture
import FeatureHomeInterface

extension CrewStore {
    public init() {
        let reducer: Reduce<State, Action> = .init { state, action in
            switch action {
            case .binding:
                return .none
                
            case .crewViewDidDisappear:
                return .none
            }
        }

        self.init(reducer: reducer)
    }
}
