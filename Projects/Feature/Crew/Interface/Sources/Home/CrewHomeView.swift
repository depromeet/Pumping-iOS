//
//  CrewHomeView.swift
//  FeatureCrewInterface
//
//  Created by Derrick kim on 2023/06/13.
//

import SwiftUI
import ComposableArchitecture

public struct CrewHomeView: View {
    public let store: StoreOf<CrewHomeStore>

    public init(store: StoreOf<CrewHomeStore>) {
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
