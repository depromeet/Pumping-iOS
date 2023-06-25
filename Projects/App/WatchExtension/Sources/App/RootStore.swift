//
//  RootStore.swift
//  AppWatchExtension
//
//  Created by 송영모 on 2023/06/26.
//

import Foundation

import ComposableArchitecture

public struct RootStore: ReducerProtocol {

    public enum State: Equatable {}
    
    public enum Action: Equatable {}
    
    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {}
        }
    }
}
