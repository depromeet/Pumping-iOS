//
//  WidthOfChangeView.swift
//  FeatureProfileInterface
//
//  Created by 김태현 on 2023/05/09.
//

import SwiftUI

import ComposableArchitecture

import SharedDesignSystem

public struct WidthOfChangeView : View {
    public let store: StoreOf<WidthOfChangeStore>

    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            descriptionView()
        }.toolbar {
            ToolbarItem(placement: .principal) {
                toolbarItemView()
            }
        }
    }

    private func descriptionView() -> some View {
        VStack(spacing: 20) {
            Spacer()

            VStack(spacing: 10) {
                Text("아직 기록이 없어요")
                    .font(.pretendard(size: 24, type: .semiBold))
                    .foregroundColor(.colorGrey900)

                Text("운동 기록이 한 주 쌓이면 생성돼요")
                    .font(.pretendard(size: 15, type: .medium))
                    .foregroundColor(.colorGrey900)
            }

            Spacer()
        }
        .offset(y: -30)
    }

    private func toolbarItemView() -> some View {
            HStack(spacing: 5) {
                Button {

                } label: {
                    Image(systemName: "arrowtriangle.left.fill")
                        .resizable()
                        .foregroundColor(Color.colorGrey200)
                        .frame(maxWidth: 10, maxHeight: 10)

                }

                Text("5월 12일 - 19일").font(.headline)
                    .font(.pretendard(size: 15, type: .medium))
                    .foregroundColor(Color.colorGrey400)

                Button {

                } label: {
                    Image(systemName: "arrowtriangle.right.fill")
                        .resizable()
                        .foregroundColor(Color.colorGrey200)
                        .frame(maxWidth: 10, maxHeight: 10)
                }
            }
    }
}
