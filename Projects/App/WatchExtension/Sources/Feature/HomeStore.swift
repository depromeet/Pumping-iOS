//
//  HomeStore.swift
//  AppWatchExtension
//
//  Created by 송영모 on 2023/06/26.
//

import Foundation

import ComposableArchitecture

public struct HomeStore: ReducerProtocol {
    
    
    public init() {}

    public struct State: Equatable {
        public weak var watchConnectivityDelegate: HomeWatchConnectivityDelegate?
        
        public init() { }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case setWatchConnectivityDelegate(HomeWatchConnectivityDelegate)
        
        case test1ButtonTapped
        case test2ButtonTapped
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
                
            case let .setWatchConnectivityDelegate(watchConnectivityDelegate):
                state.watchConnectivityDelegate = watchConnectivityDelegate
                return .none
                
            case .test1ButtonTapped:
                debugPrint("1")
                return .none
                
            default:
                return .none
            }
        }
    }
}
