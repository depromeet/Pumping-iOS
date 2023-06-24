//
//  CrewMakeView.swift
//  FeatureCrewInterface
//
//  Created by 박현우 on 2023/06/24.
//

import SwiftUI
import ComposableArchitecture
import SharedDesignSystem

struct CrewMakeView: View {
    public let store: StoreOf<CrewHomeStore>
    @Environment(\.dismiss) var dismiss
    
    public init(
        store: StoreOf<CrewHomeStore>
    ) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                
            }
            .pumpingNavigationBar(leadingButtonAction: { dismiss() })
        }
    }
    
}
