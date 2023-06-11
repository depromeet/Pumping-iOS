//
//  ProfileHeartRateView.swift
//  FeatureProfileInterface
//
//  Created by Derrick kim on 2023/06/01.
//

import SwiftUI

import ComposableArchitecture

import SharedDesignSystem

struct ProfileHeartRateView: View {
    private let store: StoreOf<ProfileRootStore>

    init(store: StoreOf<ProfileRootStore>) {
        self.store = store
    }
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(alignment: .leading) {
                HStack(spacing: 4) {
                    SharedDesignSystemAsset.Images.clock.swiftUIImage
                    Text("심박수 유지")
                        .font(.pretendard(size: 15, type: .light))
                }

                HStack(spacing: 5) {
                    Text("200")
                        .foregroundColor(Color.colorTeal300)
                        .font(.tenada(size: 32))
                        .baselineOffset(-5)

                    Text("bpm")
                        .foregroundColor(Color.colorTeal300)
                        .font(.pretendard(size: 16, type: .semiBold))
                        .offset(y: 5)
                }
                .foregroundColor(Color.colorTeal300)

                Spacer()

                if viewStore.hasComparison {
                    Text("150bpm")
                        .font(.tenada(size: 18))
                        .baselineOffset(-10)
                        .padding(.init(top: 2, leading: 10, bottom: 7, trailing: 10))
                        .foregroundColor(Color.colorGrey900)
                        .background(Color.black)
                        .cornerRadius(12)
                    Spacer()
                }
            }
            .padding(.init(top: 16, leading: 16, bottom: 16, trailing: 16))
        }
    }
}