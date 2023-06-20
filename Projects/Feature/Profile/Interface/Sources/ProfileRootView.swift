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
    private let profileSubject: ProfileSubject

    public init(store: StoreOf<ProfileRootStore>, profileSubject: ProfileSubject) {
        self.store = store
        self.profileSubject = profileSubject
    }

    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationStack(path: viewStore.binding(\.$path)) {
                ProfileView(
                    store: self.store.scope(state: \.profile, action: { .profile($0) }),
                    profileSubject: .my
                )
                .navigationDestination(for: ProfileScene.self) { scene in
                    switch scene {
                    case .widthOfChange:
                        IfLetStore(self.store.scope(state: \.widthOfChange, action: { .widthOfChange($0) })) {
                            WidthOfChangeView(store: $0)
                        }
                    default:
                        EmptyView()
                    }
                }
            }
        }
    }
}
