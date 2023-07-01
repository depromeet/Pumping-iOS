//
//  RootStore.swift
//  AppWatchExtension
//
//  Created by 송영모 on 2023/06/26.
//

import Foundation

import ComposableArchitecture

public struct RootStore: ReducerProtocol {

    public enum State: Equatable {
        case home(HomeStore.State)
        
        public init() {
            self = .home(.init())
        }
    }
    
    public enum Action: Equatable {
        case home(HomeStore.Action)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .home:
                return .none
            }
        }
        .ifCaseLet(/State.home, action: /Action.home) {
            HomeStore()
        }
    }
}

