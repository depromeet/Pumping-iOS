//
//  HomeView.swift
//  AppWatchExtension
//
//  Created by 송영모 on 2023/06/26.
//

import SwiftUI

import ComposableArchitecture

public struct HomeView: View {
    public let store: StoreOf<HomeStore>
    @State private var watchConnectivityDelegate: HomeWatchConnectivityDelegate?
    
    public init(store: StoreOf<HomeStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(spacing: .zero) {
                Text("recive")
                
                Button("Send1") {
                    viewStore.send(.test1ButtonTapped)
                }
                
                Button("Send2") {
                    viewStore.send(.test2ButtonTapped)
                }
            }
            .onAppear {
                let watchConnectivityDelegate = HomeWatchConnectivityDelegate(viewStore: viewStore)
                
                self.watchConnectivityDelegate = watchConnectivityDelegate
                viewStore.send(.setWatchConnectivityDelegate(watchConnectivityDelegate))
            }
            .ignoresSafeArea()
        }
    }
}
