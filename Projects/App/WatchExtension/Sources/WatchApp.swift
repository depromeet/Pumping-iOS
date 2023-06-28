//
//  WatchApp.swift
//  AppWatchExtension
//
//  Created by 송영모 on 2023/04/26.
//

import SwiftUI

@main
struct WatchApp: App {
    @StateObject private var workoutManager = WorkoutManager()

    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationStack {
                StartView()
            }
            .onAppear {
                workoutManager.requestAuthorization()
            }
            .sheet(isPresented: $workoutManager.showingSummaryView) {
                SummaryView()
            }
            .environmentObject(workoutManager)
        }
    }
}
