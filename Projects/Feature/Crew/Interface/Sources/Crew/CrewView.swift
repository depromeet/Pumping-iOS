//
//  CrewView.swift
//  FeatureCrewInterface
//
//  Created by Derrick kim on 2023/06/15.
//

import SwiftUI
import ComposableArchitecture

public struct CrewView: View {
    public let store: StoreOf<CrewStore>

    public init(store: StoreOf<CrewStore>) {
        self.store = store
    }

    public var body: some View {
        Text("Crew View!")
            .foregroundColor(.white)
    }
}
