//
//  RankingView.swift
//  FeatureHomeInterface
//
//  Created by Derrick kim on 2023/06/15.
//

import SwiftUI
import ComposableArchitecture

public struct RankingView: View {
    public let store: StoreOf<RankingStore>

    public init(store: StoreOf<RankingStore>) {
        self.store = store
    }

    public var body: some View {
        Text("Rank View")
    }
}
