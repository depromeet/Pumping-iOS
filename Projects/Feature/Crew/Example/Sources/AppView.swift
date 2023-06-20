import SwiftUI

import FeatureCrewInterface
import FeatureCrew

@main
struct AppView: App {
    var body: some Scene {
        WindowGroup {
            CrewRootView(store: .init(initialState: .init(), reducer: CrewRootStore()._printChanges()))
        }
    }
}
