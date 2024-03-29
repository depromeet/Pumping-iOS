//
//  CrewRootView.swift
//  FeatureCrewInterface
//
//  Created by Derrick kim on 2023/06/13.
//

import SwiftUI

import ComposableArchitecture

import FeatureProfileInterface
import SharedDesignSystem

public struct CrewRootView: View {
    public let store: StoreOf<CrewRootStore>
    
    public init(
        store: StoreOf<CrewRootStore>
    ) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationStack(path: viewStore.binding(\.$path)) {
                CrewHomeView(store: self.store.scope(state: \.crewHome, action: { .crewHome($0) }))
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationDestination(for: CrewScene.self) { scene in
                        switch scene {
                        case .crewRanking:
                            IfLetStore(self.store.scope(state: \.crewRanking, action: { .crewRanking($0) })) {
                                CrewRankingView(store: $0)
                            }
                            
                        case .profile:
                            IfLetStore(self.store.scope(state: \.profileHome, action: { .profileHome($0) })) {
                                ProfileHomeView(store: $0)
                                    .toolbarBackground(.hidden, for: .navigationBar)
                                    .toolbarRole(.editor)
                            }
                            
                        case .widthOfChange:
                            IfLetStore(self.store.scope(state: \.profileWidthOfChange, action: { .profileWidthOfChange($0) })) {
                                ProfileWidthOfChangeView(store: $0)
                                    .toolbarRole(.editor)
                            }
                        }
                    }
            }
            .accentColor(PumpingColors.colorGrey800.swiftUIColor)
        }
    }
}
