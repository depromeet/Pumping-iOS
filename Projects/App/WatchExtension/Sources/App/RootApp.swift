//
//  WatchApp.swift
//  AppWatchExtension
//
//  Created by 송영모 on 2023/04/26.
//

import SwiftUI

import ComposableArchitecture

import WatchSharedDesignSystem

@main
struct RootApp: App {
    @StateObject private var workoutDelegate = WorkoutDelegate()
    @StateObject private var watchConnectivityDelegate = WatchConnectivityDelegate()
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            RootView(store: .init(initialState: RootStore.State(), reducer: RootStore()._printChanges()))
                .environmentObject(workoutDelegate)
                .environmentObject(watchConnectivityDelegate)
                .onAppear {
                    WatchSharedDesignSystemFontFamily.registerAllCustomFonts()
                }
        }
    }
}
