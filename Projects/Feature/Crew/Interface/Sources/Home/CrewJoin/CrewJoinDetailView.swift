//
//  CrewJoinDetailView.swift
//  FeatureCrewInterface
//
//  Created by 박현우 on 2023/06/24.
//

import SwiftUI
import ComposableArchitecture
import Shared

struct CrewJoinDetailView: View {
    
    public let store: StoreOf<CrewHomeStore>
    @Environment(\.dismiss) var dismiss
    
    public init(
        store: StoreOf<CrewHomeStore>
    ) {
        self.store = store
    }
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .onTapGesture {
                        viewStore.send(.dismissCrewJoinView)
                    }
            }
            .pumpingNavigationBar(leadingButtonAction: { dismiss() })
            
        }
    }
}
