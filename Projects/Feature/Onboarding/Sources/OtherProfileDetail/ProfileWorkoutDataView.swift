//
//  ProfileWorkoutDataView.swift
//  SharedDesignSystem
//
//  Created by Derrick kim on 2023/06/01.
//

import SwiftUI
import SharedDesignSystem

struct ProfileWorkoutDataView: View {
    var body: some View {
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

                Text("00:00:00")
                    .font(.tenada(size: 18))
                    .padding(.init(top: 15, leading: 10, bottom: 10, trailing: 10))
                    .foregroundColor(Color.colorGrey900)
                    .background(Color.black)
                    .cornerRadius(12)

                Spacer()
            }
            .padding(.init(top: 16, leading: 16, bottom: 16, trailing: 16))

            VStack(alignment: .leading) {
                ForEach(["데트리프트","렛풀다운","플랭크","세트세트"], id: \.self) { workout in
                    Text(workout)
                        .foregroundColor(Color.colorBlue400)
                        .font(.pretendard(size: 16, type: .light))
                }
            }
            .padding(.init(top: 16, leading: 16, bottom: 16, trailing: 16))
        }
    }
}

struct ProfileWorkoutDataView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileWorkoutDataView()
    }
}
