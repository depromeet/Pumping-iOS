//
//  OtherProfileDetailView.swift
//  FeatureOnboarding
//
//  Created by 송영모 on 2023/05/12.
//

import SwiftUI

import ComposableArchitecture

import FeatureOnboardingInterface

extension OtherProfileDetailView: View {
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            Text("상세 페이지 \(viewStore.state.index)")
        }
    }
}
