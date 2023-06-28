//
//  CrewRootView.swift
//  FeatureCrewInterface
//
//  Created by Derrick kim on 2023/06/13.
//

import SwiftUI
import ComposableArchitecture
import FeatureProfileInterface

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
                    .sheet(isPresented: viewStore.binding(\.$showingCrew)) {
                        IfLetStore(self.store.scope(state: \.crew, action: { .crew($0) })) {
                            CrewView(store: $0)
                                .presentationDetents([.medium, .large])
                        }
                    }
                    .navigationDestination(for: CrewScene.self) { scene in
                        switch scene {
                        case .crewRanking:
                            IfLetStore(self.store.scope(state: \.crewRanking, action: { .crewRanking($0) })) {
                                CrewRankingView(store: $0)
                                    .toolbarRole(.editor)
                            }
                            
//                        case .profile:
//                            IfLetStore(self.store.scope(state: \.profile, action: { .profile($0) })) {
//                                ProfileView(store: $0, profileSubject: .my)
//                                    .toolbarRole(.editor)
//                            }
//                            
//                        case .widthOfChange:
//                            IfLetStore(self.store.scope(state: \.widthOfChange, action: { .widthOfChange($0) })) {
//                                WidthOfChangeView(store: $0)
//                                    .toolbarRole(.editor)
//                            }
                        }
                    }
            }
        }
    }
}
