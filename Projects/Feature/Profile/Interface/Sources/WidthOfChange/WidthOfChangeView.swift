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

                    recordItemListView(
                        previousData: ["3시간","100kcal", "2시간 / 100bpm", "2시간 / 하체"],
                        currentData: ["5시간","300kcal", "120bpm", "상체"])
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

    private func recordItemView(_ record: RecordItem) -> some View {
        ZStack {
            record.image

            GeometryReader { geometry in
                VStack(alignment: .leading, spacing: 15) {
                    HStack(spacing: 5) {
                        Text(record.title)
                            .font(.pretendard(size: 15, type: .extraBold))
                            .foregroundColor(.colorGrey900)

                        Text("45%")
                            .font(.pretendard(size: 15, type: .medium))
                            .foregroundColor(.colorCyan200)
                            .offset(x: 3)

                        SharedDesignSystemAsset.Images.arrowForPercentage.swiftUIImage
                            .offset(y: 4)
                    }
                    .offset(y: -5)

                    VStack(alignment: .leading, spacing: 5) {
                        Text("지난주")
                            .font(.pretendard(size: 12, type: .extraLight))
                            .foregroundColor(.colorGrey600)

                        Text(record.previousData)
                            .font(.pretendard(size: 15, type: .medium))
                            .foregroundColor(.colorGrey800)
                    }
                    .offset(y: 8)
                }
                .frame(width: geometry.size.width, alignment: .leading)
                .offset(x: 20, y: -10)

                VStack(alignment: .trailing, spacing: 2) {
                    Spacer()

                    if WidthOfChangeType(rawValue: record.title) == .averageHeartRate
                        || WidthOfChangeType(rawValue: record.title) == .maximumPart {
                        Text("5시간 /")
                            .font(.pretendard(size: 18, type: .medium))
                            .foregroundColor(.colorGrey900)
                    }

                    HStack {
                        SharedDesignSystemAsset.Images.arrow.swiftUIImage

                        Text(record.currentData)
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

    private func recordItemListView(previousData: [String], currentData: [String]) -> some View {
        ForEach(Array(WidthOfChangeType.allCases.enumerated()), id: \.element) { index, type in
            recordItemView(
                RecordItem(
                    image: type.image,
                    title: type.rawValue,
                    previousData: previousData[index],
                    currentData: currentData[index]))
        }
    }
}
