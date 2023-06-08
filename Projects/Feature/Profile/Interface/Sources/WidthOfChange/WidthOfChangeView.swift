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
            VStack(spacing: 20) {
                Spacer()

                RectangleXView()

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

//            VStack {
//                VStack(alignment: .leading, spacing: 10) {
//                    Text("변화폭")
//                        .font(.pretendard(size: 24, type: .extraBold))
//                        .foregroundColor(Color.colorGrey900)
//
//                    Text("지난 주에 비해 달라진 기록을 확인해보세요.음하하하")
//                        .font(.pretendard(size: 15, type: .medium))
//                        .foregroundColor(Color.colorGrey600)
//                }
//
//                Text("")
//
//            }
        }
    }
}
