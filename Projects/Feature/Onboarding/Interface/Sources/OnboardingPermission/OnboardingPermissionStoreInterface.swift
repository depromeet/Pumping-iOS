//
//  OnboardingPermissionStoreInterface.swift
//  FeatureOnboardingInterface
//
//  Created by 박현우 on 2023/06/02.
//

import Foundation
import ComposableArchitecture

public struct OnboardingPermissionStore : ReducerProtocol {
    private let reducer: Reduce<State, Action>
    
    public init(reducer: Reduce<State, Action>) {
        self.reducer = reducer
    }
    
    public struct State: Equatable {
        public init() {}
    }
    
    public enum Action: Equatable {
        case moveToNextStep
        case failToAuthorize
    }
    
    public var body: some ReducerProtocol<State, Action> {
        reducer
    }
}
