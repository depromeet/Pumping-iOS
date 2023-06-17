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
            ScrollView {
                VStack(spacing: 70) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("변화폭")
                            .font(.pretendard(size: 24, type: .extraBold))
                            .foregroundColor(Color.colorGrey900)

                        Text("지난 주에 비해 달라진 기록을 확인해보세요.음하하하")
                            .font(.pretendard(size: 15, type: .medium))
                            .foregroundColor(Color.colorGrey600)
                    }
                    .offset(x: -25)

                    ForEachStore(self.store.scope(state: \.widthOfChangeList, action: WidthOfChangeStore.Action.widthOfChangeCell(id:action:))) {
                        WidthOfChangeCellView(store: $0)
                    }
                }
            }
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

            Text("5월 12일 - 19일")
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
