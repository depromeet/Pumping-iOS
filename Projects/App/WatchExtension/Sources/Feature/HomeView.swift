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
    
    @State public var watchConnectivityDelegate: HomeWatchConnectivityDelegate?
    @State public var workoutDelegate: HomeWorkoutDelegate?
    
    public init(store: StoreOf<HomeStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(spacing: .zero) {
                Text("heartrate: \(workoutDelegate?.heartRate ?? 0)")
                
                Text("calorie: \(viewStore.calorie)")
                
                Button("start") {
                    viewStore.send(.startButtonTapped)
                }
            }
            .onAppear {
                let watchConnectivityDelegate = HomeWatchConnectivityDelegate(viewStore: viewStore)
                let workoutDelegate = HomeWorkoutDelegate(viewStore: viewStore)
                
                self.watchConnectivityDelegate = watchConnectivityDelegate
                self.workoutDelegate = workoutDelegate
                
                viewStore.send(.setWatchConnectivityDelegate(watchConnectivityDelegate))
                viewStore.send(.setWorkoutDelegate(workoutDelegate))
                
                workoutDelegate.requestAuth()
            }
            .ignoresSafeArea()
        }
    }
}
