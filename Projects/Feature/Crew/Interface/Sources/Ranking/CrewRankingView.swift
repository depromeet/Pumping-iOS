//
//  CrewRankingView.swift
//  FeatureCrewInterface
//
//  Created by Derrick kim on 2023/06/15.
//

import SwiftUI
import ComposableArchitecture

public struct CrewRankingView: View {
    public let store: StoreOf<CrewRankingStore>

    public init(
        store: StoreOf<CrewRankingStore>
    ) {
        self.store = store
    }

    public var body: some View {
        Text("Rank View")
    }
}
