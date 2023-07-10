//
//  ProfileRootView.swift
//  FeatureProfileInterface
//
//  Created by Derrick kim on 2023/06/06.
//

import SwiftUI
import ComposableArchitecture
import SharedDesignSystem

public struct ProfileRootView : View {
    public let store: StoreOf<ProfileRootStore>
    
    public init(store: StoreOf<ProfileRootStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationStack(path: viewStore.binding(\.$path)) {
                ProfileHomeView(store: self.store.scope(state: \.home, action: { .home($0) }))
                    .navigationDestination(for: ProfileScene.self) { scene in
                        switch scene {
                        case .widthOfChange:
                            IfLetStore(self.store.scope(state: \.widthOfChange, action: { .widthOfChange($0) })) {
                                ProfileWidthOfChangeView(store: $0)
                            }
                        default:
                            EmptyView()
                        }
                    }
            }
        }
    }
}
