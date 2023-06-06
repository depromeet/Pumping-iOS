import SwiftUI

import FeatureWorkoutInterface
import FeatureWorkout
import SharedDesignSystem

@main
struct AppView: App {
    var body: some Scene {
        WindowGroup {
            WorkoutRootView(store: .init(initialState: .init(), reducer: WorkoutRootStore()._printChanges()))
                .onAppear {
                    SharedDesignSystemFontFamily.registerAllCustomFonts()
                }
        }
    }
}

