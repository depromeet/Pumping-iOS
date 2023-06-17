//
//  ProfileWorkoutTimeView.swift
//  FeatureProfileInterface
//
//  Created by Derrick kim on 2023/06/01.
//

import SwiftUI
import ComposableArchitecture
import SharedDesignSystem

struct ProfileWorkoutTimeView: View {
    private let store: StoreOf<ProfileRootStore>

    init(store: StoreOf<ProfileRootStore>) {
        self.store = store
    }

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(alignment: .leading) {
                HStack(spacing: 4) {
                    SharedDesignSystemAsset.Images.clock.swiftUIImage
                    Text("시간")
                        .font(.pretendard(size: 15, type: .light))
                }

                Text("01:28:03")
                    .foregroundColor(Color.colorCyan500)
                    .font(.tenada(size: 32))
                    .baselineOffset(-5)

                Spacer()

                if viewStore.hasComparison {
                    Text("00:00:00")
                        .font(.tenada(size: 18))
                        .baselineOffset(-10)
                        .padding(.init(top: 2, leading: 10, bottom: 7, trailing: 10))
                        .foregroundColor(viewStore.hasComparison ? Color.colorGrey900 : nil)
                        .background(viewStore.hasComparison ? Color.black : nil)
                        .cornerRadius(12)
                }
            }
            .padding(.init(top: 16, leading: 16, bottom: 16, trailing: 16))
        }
    }
}
