//
//  OnboardingNicknameView.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/05.
//

import SwiftUI

import ComposableArchitecture

import FeatureOnboardingInterface
import SharedDesignSystem

extension OnboardingNicknameView: View {
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                Text("Nickname View")
                    .foregroundColor(.colorGreenPrimary)
                    .font(.pretendard(size: 30, type: .thin))
                Button("next button") {
                    viewStore.send(.tapNextButton)
                }
            }
        }
    }
}
