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

                    ZStack {
                        SharedDesignSystemAsset.Images.widthOfChange_workoutTime.swiftUIImage
                        VStack(alignment: .leading, spacing: 15) {
                            HStack(spacing: 5) {
                                Text("운동시간")
                                    .font(.pretendard(size: 15, type: .extraBold))
                                    .foregroundColor(.colorGrey900)

                                Text("45%")
                                    .font(.pretendard(size: 15, type: .medium))
                                    .foregroundColor(.colorCyan200)
                                    .offset(x: 3)

                                SharedDesignSystemAsset.Images.arrowForPercentage.swiftUIImage
                                    .offset(y: 4)
                            }
                            .offset(y: -10)

                            VStack(alignment: .leading, spacing: 5) {
                                Text("지난주")
                                    .font(.pretendard(size: 12, type: .extraLight))
                                    .foregroundColor(.colorGrey600)

                                Text("3시간")
                                    .font(.pretendard(size: 15, type: .medium))
                                    .foregroundColor(.colorGrey800)
                            }
                        }
                        .offset(x: -120, y: -15)

                        HStack {
                            SharedDesignSystemAsset.Images.arrow.swiftUIImage

                            Text("5시간")
                                .font(.tenada(size: 32))
                                .baselineOffset(-5)
                        }
                        .offset(x: 120, y: -5)
                    }

                    ZStack {
                        SharedDesignSystemAsset.Images.widthOfChange_Calorie.swiftUIImage
                        VStack(alignment: .leading, spacing: 15) {
                            HStack(spacing: 5) {
                                Text("칼로리")
                                    .font(.pretendard(size: 15, type: .extraBold))
                                    .foregroundColor(.colorGrey900)

                                Text("45%")
                                    .font(.pretendard(size: 15, type: .medium))
                                    .foregroundColor(.colorCyan200)
                                    .offset(x: 3)

                                SharedDesignSystemAsset.Images.arrowForPercentage.swiftUIImage
                                    .offset(y: 4)
                            }
                            .offset(y: -10)

                            VStack(alignment: .leading, spacing: 5) {
                                Text("지난주")
                                    .font(.pretendard(size: 12, type: .extraLight))
                                    .foregroundColor(.colorGrey600)

                                Text("100kcal")
                                    .font(.pretendard(size: 15, type: .medium))
                                    .foregroundColor(.colorGrey800)
                            }
                        }
                        .offset(x: -125, y: -15)

                        HStack {
                            SharedDesignSystemAsset.Images.arrow.swiftUIImage

                            Text("300kcal")
                                .font(.tenada(size: 32))
                                .baselineOffset(-5)
                        }
                        .offset(x: 95, y: -5)
                    }

                    ZStack {
                        SharedDesignSystemAsset.Images.widthOfChange_HearRate.swiftUIImage
                        VStack(alignment: .leading, spacing: 15) {
                            HStack(spacing: 5) {
                                Text("평균 심박수")
                                    .font(.pretendard(size: 15, type: .extraBold))
                                    .foregroundColor(.colorGrey900)

                                Text("45%")
                                    .font(.pretendard(size: 15, type: .medium))
                                    .foregroundColor(.colorCyan200)
                                    .offset(x: 3)

                                SharedDesignSystemAsset.Images.arrowForPercentage.swiftUIImage
                                    .offset(y: 4)
                            }
                            .offset(y: -10)

                            VStack(alignment: .leading, spacing: 5) {
                                Text("지난주")
                                    .font(.pretendard(size: 12, type: .extraLight))
                                    .foregroundColor(.colorGrey600)

                                Text("2시간 / 100bpm")
                                    .font(.pretendard(size: 15, type: .medium))
                                    .foregroundColor(.colorGrey800)
                            }
                        }
                        .offset(x: -110, y: -15)

                        VStack(alignment: .trailing, spacing: 2) {
                            Text("평균 5시간 /")
                                .font(.pretendard(size: 18, type: .medium))
                                .foregroundColor(.colorGrey900)

                            HStack {
                                SharedDesignSystemAsset.Images.arrow.swiftUIImage

                                Text("120bpm")
                                    .font(.tenada(size: 32))
                                    .baselineOffset(-5)
                            }
                        }
                        .offset(x: 95, y: -5)
                    }

                    ZStack {
                        SharedDesignSystemAsset.Images.widthOfChange_MaximumPart.swiftUIImage
                        VStack(alignment: .leading, spacing: 15) {
                            HStack(spacing: 5) {
                                Text("최대운동부위")
                                    .font(.pretendard(size: 15, type: .extraBold))
                                    .foregroundColor(.colorGrey900)

                                Text("45%")
                                    .font(.pretendard(size: 15, type: .medium))
                                    .foregroundColor(.colorCyan200)
                                    .offset(x: 3)

                                SharedDesignSystemAsset.Images.arrowForPercentage.swiftUIImage
                                    .offset(y: 4)
                            }
                            .offset(y: -10)

                            VStack(alignment: .leading, spacing: 5) {
                                Text("지난주")
                                    .font(.pretendard(size: 12, type: .extraLight))
                                    .foregroundColor(.colorGrey600)

                                Text("2시간 / 하체")
                                    .font(.pretendard(size: 15, type: .medium))
                                    .foregroundColor(.colorGrey800)
                            }
                        }
                        .offset(x: -105, y: -15)

                        VStack(alignment: .trailing, spacing: 2) {
                            Text("5시간 /")
                                .font(.pretendard(size: 18, type: .medium))
                                .foregroundColor(.colorGrey900)

                            HStack {
                                SharedDesignSystemAsset.Images.arrow.swiftUIImage

                                Text("상체")
                                    .font(.tenada(size: 32))
                                    .baselineOffset(-5)
                            }
                        }
                        .offset(x: 130, y: -5)
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
