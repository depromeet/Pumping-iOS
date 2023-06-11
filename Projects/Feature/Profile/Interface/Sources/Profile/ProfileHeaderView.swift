//
//  ProfileHeaderView.swift
//  FeatureProfileInterface
//
//  Created by Derrick kim on 2023/06/01.
//

import SwiftUI

struct ProfileHeaderView: View {
    @State var profileSubject: ProfileSubject

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            VStack(alignment: .leading, spacing: 5) {
                Text("5위")
                    .font(.pretendard(size: 13, type: .extraLight))
                    .foregroundColor(.colorGrey800)

                HStack(alignment: .center, spacing: 10) {
                    if profileSubject == .my {
                        HStack {
                            Text("나")
                                .font(.pretendard(size: 16, type: .semiBold))
                                .foregroundColor(Color.colorGrey900)
                                .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 10))
                        }
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(12)
                    }

                    Text("보민")
                        .font(.tenada(size: 32))
                        .foregroundColor(.white)
                        .baselineOffset(-10)
                }
            }

            Text("원래 영웅은\n성공전이 어두운법")
                .font(.pretendard(size: 15, type: .light))
                .foregroundColor(.colorGrey700)
        }
    }
}
