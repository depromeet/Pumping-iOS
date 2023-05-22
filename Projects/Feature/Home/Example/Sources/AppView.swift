import SwiftUI

import FeatureHomeInterface
import FeatureHome

@main
struct AppView: App {
    var body: some Scene {
        WindowGroup {
            HomeRootView(store: .init(initialState: .init(), reducer: HomeRootStore()._printChanges()))
        }
    }
}
