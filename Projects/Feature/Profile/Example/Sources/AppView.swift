import SwiftUI

import FeatureProfileInterface
import FeatureProfile

@main
struct AppView: App {
    var body: some Scene {
        WindowGroup {
            ProfileRootView(store: .init(initialState: .init(), reducer: ProfileRootStore()._printChanges()))
        }
    }
}
