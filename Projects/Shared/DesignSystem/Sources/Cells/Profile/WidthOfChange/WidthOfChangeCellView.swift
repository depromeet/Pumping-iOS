//
//  WidthOfChangeCellView.swift
//  SharedDesignSystem
//
//  Created by Derrick kim on 2023/06/14.
//

import SwiftUI
import ComposableArchitecture

public struct WidthOfChangeCellView: View {
    public let store: StoreOf<WidthOfChangeCellStore>

    public init(store: StoreOf<WidthOfChangeCellStore>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack {
                viewStore.title.image

                GeometryReader { geometry in
                    VStack(alignment: .leading, spacing: 15) {
                        HStack(spacing: 5) {
                            Text(viewStore.title.rawValue)
                                .font(.pretendard(size: 15, type: .extraBold))
                                .foregroundColor(.colorGrey900)

                            Text("45%")
                                .font(.pretendard(size: 15, type: .medium))
                                .foregroundColor(.colorCyan200)
                                .offset(x: 3)

                            Image
                                .arrowForPercentage
                                .offset(y: 4)
                        }
                        .offset(y: -5)

                        VStack(alignment: .leading, spacing: 5) {
                            Text("지난주")
                                .font(.pretendard(size: 12, type: .extraLight))
                                .foregroundColor(.colorGrey600)

                            Text(viewStore.previousData)
                                .font(.pretendard(size: 15, type: .medium))
                                .foregroundColor(.colorGrey800)
                        }
                        .offset(y: 8)
                    }
                    .frame(width: geometry.size.width, alignment: .leading)
                    .offset(x: 20, y: -10)

                    VStack(alignment: .trailing, spacing: 2) {
                        Spacer()

                        if viewStore.title == .averageHeartRate
                            || viewStore.title == .maxWorkoutPart {
                            Text(viewStore.currentTime ?? "")
                                .font(.pretendard(size: 18, type: .medium))
                                .foregroundColor(.colorGrey900)
                        }

                        HStack {
                            Image
                                .arrow

                            Text(viewStore.currentData)
                                .font(.tenada(size: 32))
                                .baselineOffset(-5)
                        }

                        Spacer()
                    }
                    .frame(width: geometry.size.width, alignment: .trailing)
                    .offset(x: -15, y: -5)
                }
            }
        }
    }
}
