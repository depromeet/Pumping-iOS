//
//  ProfileCalorieView.swift
//  FeatureOnboarding
//
//  Created by Derrick kim on 2023/06/01.
//

import SwiftUI
import SharedDesignSystem

struct ProfileCalorieView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 4) {
                SharedDesignSystemAsset.Images.clock.swiftUIImage
                Text("칼로리")
                    .font(.pretendard(size: 15, type: .light))
            }

            HStack {
                Text("300")
                    .foregroundColor(Color.colorGreen600)
                    .font(.tenada(size: 32))

                Text("Kcal")
                    .foregroundColor(Color.colorGreen600)
                    .font(.pretendard(size: 16, type: .semiBold))
            }

            Spacer()

            Text("00:00:00")
                .font(.tenada(size: 18))
                .padding(.init(top: 15, leading: 10, bottom: 10, trailing: 10))
                .foregroundColor(Color.colorGrey900)
                .background(Color.black)
                .cornerRadius(12)

            Spacer()
        }
        .padding(.init(top: 16, leading: 16, bottom: 16, trailing: 16))
    }
}

struct ProfileCalorieView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCalorieView()
    }
}
