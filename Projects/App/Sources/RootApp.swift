//
//  App.swift
//  iOSApp
//
//  Created by 송영모 on 2023/04/26.
//

import SwiftUI
import ComposableArchitecture
import Feature
import SharedDesignSystem

@main
struct RootApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(store: .init(initialState: MainStore.State(), reducer: MainStore()._printChanges()))
                .onAppear {
                    SharedDesignSystemFontFamily.registerAllCustomFonts()
                }
        }
    }
}
