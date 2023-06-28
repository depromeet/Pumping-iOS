//
//  App.swift
//  iOSApp
//
//  Created by 송영모 on 2023/04/26.
//

import SwiftUI
import ComposableArchitecture
import Feature
import Shared
import Core

//class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        HealthKitManager.shared.setting()
//        return true
//    }
//}

@main
struct RootApp: App {
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            RootView(store: .init(initialState: RootStore.State(), reducer: RootStore()._printChanges()))
                .onAppear {
                    SharedDesignSystemFontFamily.registerAllCustomFonts()
                }
                .onAppear {
                    UIApplication.shared.addTapGestureRecognizer()
                }
        }
    }
}
