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
    var body: some Scene {
        WindowGroup {
            RootView(store: .init(initialState: RootStore.State(), reducer: RootStore()._printChanges()))
        }
    }
}
