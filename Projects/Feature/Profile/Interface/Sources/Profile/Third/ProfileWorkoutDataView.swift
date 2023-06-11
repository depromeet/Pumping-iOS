//
//  ProfileWorkoutDataView.swift
//  FeatureProfileInterface
//
//  Created by Derrick kim on 2023/06/01.
//

import SwiftUI

import ComposableArchitecture

import SharedDesignSystem

struct ProfileWorkoutDataView: View {
    private let store: StoreOf<ProfileRootStore>

    init(store: StoreOf<ProfileRootStore>) {
        self.store = store
    }
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            HStack(spacing: 40) {
                VStack(alignment: .leading) {
                    HStack(spacing: 4) {
                        SharedDesignSystemAsset.Images.clock.swiftUIImage
                        Text("최대 운동 부위")
                            .font(.pretendard(size: 15, type: .light))
                    }

                    HStack {
                        Text("상체")
                            .foregroundColor(Color.colorBlue400)
                            .font(.tenada(size: 32))

                        Text("/ 1시간")
                            .foregroundColor(Color.colorBlue400)
                            .font(.pretendard(size: 16, type: .semiBold))
                    }
                    .foregroundColor(Color.colorTeal300)

                    Spacer()

                    if viewStore.hasComparison {
                        Text("하체/2시간")
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
}
