//
//  HomeView.swift
//  FeatureHome
//
//  Created by Derrick kim on 2023/06/13.
//

import SwiftUI
import ComposableArchitecture

public struct HomeView: View {
    public let store: StoreOf<HomeStore>

    public init(store: StoreOf<HomeStore>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                Text("hi")
            }
        }
    }
}
