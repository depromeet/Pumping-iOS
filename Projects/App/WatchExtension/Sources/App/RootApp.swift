//
//  WatchApp.swift
//  AppWatchExtension
//
//  Created by 송영모 on 2023/04/26.
//

import SwiftUI
import ComposableArchitecture

@main
struct RootApp: App {
    @StateObject private var workoutDelegate = WorkoutDelegate()
    @StateObject private var watchConnectivityDelegate = WatchConnectivityDelegate()
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            RootView(store: .init(initialState: RootStore.State(), reducer: RootStore()._printChanges()))
                .environmentObject(workoutDelegate)
                .environmentObject(watchConnectivityDelegate)
        }
    }
}

//TODO: workout session 으로 마이그레이션 후 주석 제거

//@main
//struct RootApp: App {
//    @StateObject private var workoutManager = WorkoutManager()
//
//    @SceneBuilder var body: some Scene {
//        WindowGroup {
//            NavigationStack {
//                StartView()
//            }
//            .onAppear {
//                workoutManager.requestAuthorization()
//            }
//            .sheet(isPresented: $workoutManager.showingSummaryView) {
//                SummaryView()
//            }
//            .environmentObject(workoutManager)
//        }
//    }
//}
//
