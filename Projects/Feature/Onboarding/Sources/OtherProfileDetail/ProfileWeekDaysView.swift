//
//  ProfileWeekDaysView.swift
//  FeatureOnboarding
//
//  Created by Derrick kim on 2023/06/01.
//

import SwiftUI

struct ProfileWeekDaysView: View {
    var body: some View {
        HStack {
            ForEach(generateWeekDays(), id: \.offset) { index, week in
                VStack {
                    VStack(spacing: 0) {
                        Text("\(Int(index) + 1)일차")
                            .font(.pretendard(size: 10, type: .light))
                            .foregroundColor(.colorGrey900)
                            .padding(.init(top: 7, leading: 6, bottom: 0, trailing: 6))

                        Circle()
                            .fill(Color.colorCyanPrimary)
                            .padding(.init(top: 4, leading: 6, bottom: 6, trailing: 6))
                            .overlay(alignment: .center) {
                                generateText(by: week)
                                    .multilineTextAlignment(.center)
                            }
                    }
//                    .background(Color.colorCyan900)
                }
                .cornerRadius(22)
                .overlay(
                    RoundedRectangle(cornerRadius: 22)
                        .stroke(Color.colorCyanPrimary, lineWidth: 1)
                )
            }
        }
        .padding()
    }

    private func generateText(by week: String) -> Text {
        return Text(week)
            .foregroundColor(.colorGrey50)
            .font(.pretendard(size: 14, type: .medium))
    }

    private func generateWeekDays() -> [EnumeratedSequence<Array<String>.SubSequence>.Element] {
        let weekdaysArray: [String] = ["월", "화", "수", "목", "금", "토", "일"]
        return weekdaysArray.enumerated().map { $0 }
    }
}

struct ProfileWeekDaysView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileWeekDaysView()
    }
}
