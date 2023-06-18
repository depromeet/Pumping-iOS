//
//  ProfileWeekDayCellView.swift
//  SharedDesignSystem
//
//  Created by Derrick kim on 2023/06/14.
//

import SwiftUI
import ComposableArchitecture

public struct ProfileWeekDayCellView: View {
    public let store: StoreOf<ProfileWeekDayCellStore>

    public init(store: StoreOf<ProfileWeekDayCellStore>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                VStack(spacing: 0) {
                    Text("\(viewStore.index + 1)일차")
                        .font(.pretendard(size: 10, type: .light))
                        .foregroundColor(.colorGrey900)
                        .padding(.init(top: 7, leading: 6, bottom: 0, trailing: 6))

                    Circle()
                        .fill(Color.colorCyanPrimary)
                        .padding(.init(top: 4, leading: 6, bottom: 6, trailing: 6))
                        .overlay(alignment: .center) {
                            Text(viewStore.weekDay)
                                .foregroundColor(.colorGrey50)
                                .font(.pretendard(size: 14, type: .medium))
                                .multilineTextAlignment(.center)
                        }
                }
            }
            .cornerRadius(22)
            .overlay(
                RoundedRectangle(cornerRadius: 22)
                    .stroke(Color.colorCyanPrimary, lineWidth: 1)
            )
        }
    }
}
