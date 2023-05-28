//
//  OtherProfileDetailView.swift
//  FeatureOnboarding
//
//  Created by 송영모 on 2023/05/12.
//

import SwiftUI

import ComposableArchitecture

import FeatureOnboardingInterface
import SharedDesignSystem

extension OtherProfileDetailView: View {
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    VStack {
                        HStack {
                            VStack(alignment: .leading, spacing: 30) {
                                VStack(alignment: .leading, spacing: 6) {
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("5위")
                                            .font(.pretendard(size: 13, type: .extraLight))
                                            .foregroundColor(.colorGrey800)

                                        Text("보민")
                                            .font(.tenada(size: 32))
                                            .foregroundColor(.white)
                                    }

                                    Text("원래 영웅은\n성공전이 어두운법")
                                        .font(.pretendard(size: 15, type: .light))
                                        .foregroundColor(.colorGrey700)
                                }

                                Button {
                                    viewStore.send(.tapHeartButton)
                                } label: {
                                    Image(systemName: "heart.fill")
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .foregroundColor(.black)
                                }
                                .frame(width: 50, height: 50)
                                .background(.white)
                                .clipShape(Circle())
                            }

                            Spacer()
                        }
                        .padding(.leading, 20)
                        .overlay(alignment: .trailing) {
                            SharedDesignSystemAsset.Images.boy.swiftUIImage
                                .resizable()
                                .frame(width: 300, height: 250)
                                .offset(x: 35)
                        }
                    }
                    .frame(height: geometry.size.height * 0.32)

                    ScrollView {
                        VStack {
                            Spacer()
                            Spacer()
                            HStack {
                                Text("운동량")
                                    .font(.pretendard(size: 18, type: .semiBold))

                                Spacer()

                                Button {
                                    viewStore.send(.tapComparisonButton)
                                } label: {
                                    HStack {
                                        Image(systemName: "checkmark")
                                            .frame(width: 15, height: 15)
                                            .foregroundColor(.colorCyanPrimary)

                                        Text("비교하기")
                                            .font(.pretendard(size: 15, type: .light))
                                            .foregroundColor(.colorGrey800)
                                    }
                                }
                            }
                            .padding(.leading, 20)
                            .padding(.trailing, 20)

                            HStack {
                                ForEach(Array(viewStore.state.week.enumerated()), id: \.offset) { index, week in
                                    VStack(spacing: 0) {
                                        Text("\(Int(index) + 1)일차")
                                            .font(.pretendard(size: 12, type: .light))
                                            .foregroundColor(.white)
                                            .padding(.init(top: 7, leading: 6, bottom: 0, trailing: 6))

                                        Circle()
                                            .fill(Color.colorCyanPrimary)
                                            .padding(.init(top: 4, leading: 6, bottom: 6, trailing: 6))
                                            .overlay(alignment: .center) {
                                                generateText(by: week.day)
                                            }
                                    }
                                    .background(Color.colorCyan200)
                                    .background(Color.colorCyan900)
                                    .cornerRadius(22)
                                }
                            }
                            .padding()

                            VStack(alignment: .leading) {
                                VStack(alignment: .leading) {
                                    HStack(spacing: 4) {
                                        SharedDesignSystemAsset.Images.clock.swiftUIImage
                                        Text("시간")
                                            .font(.pretendard(size: 15, type: .light))
                                    }

                                    Text("01:28:03")
                                        .foregroundColor(Color.colorCyan500)
                                        .font(.tenada(size: 32))

                                    Spacer()

                                    Text("00:00:00")
                                        .font(.tenada(size: 18))
                                        .padding(10)
                                        .foregroundColor(Color.colorGrey900)
                                        .background(Color.black)
                                        .cornerRadius(12)
                                }
                                .padding(.init(top: 16, leading: 16, bottom: 16, trailing: 16))

                                Divider()
                                    .foregroundColor(Color.colorGrey200)
                                    .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))

                                HStack(spacing: 40) {
                                    VStack(alignment: .leading) {
                                        HStack(spacing: 4) {
                                            SharedDesignSystemAsset.Images.clock.swiftUIImage
                                            Text("심박수 유지")
                                                .font(.pretendard(size: 15, type: .light))
                                        }

                                        HStack {
                                            Text("200")
                                                .foregroundColor(Color.colorTeal300)
                                                .font(.tenada(size: 32))

                                            Text("bpm")
                                                .foregroundColor(Color.colorTeal300)
                                                .font(.pretendard(size: 16, type: .semiBold))
                                        }
                                        .foregroundColor(Color.colorTeal300)
                                        
                                        Spacer()

                                        Text("00:00:00")
                                            .font(.title3)
                                            .padding(10)
                                            .foregroundColor(Color.colorGrey900)
                                            .background(Color.black)
                                            .cornerRadius(12)

                                        Spacer()
                                    }
                                    .padding(.init(top: 16, leading: 16, bottom: 16, trailing: 16))

                                    VStack(alignment: .leading) {
                                        HStack(spacing: 4) {
                                            SharedDesignSystemAsset.Images.clock.swiftUIImage
                                            Text("칼로리")
                                                .font(.pretendard(size: 15, type: .light))
                                        }

                                        HStack {
                                            Text("300")
                                                .foregroundColor(Color.colorGreen600)
                                                .font(.tenada(size: 32))

                                            Text("Kcal")
                                                .foregroundColor(Color.colorGreen600)
                                                .font(.pretendard(size: 16, type: .semiBold))
                                        }

                                        Spacer()

                                        Text("00:00:00")
                                            .font(.tenada(size: 18))
                                            .padding(10)
                                            .foregroundColor(Color.colorGrey900)
                                            .background(Color.black)
                                            .cornerRadius(12)

                                        Spacer()
                                    }
                                    .padding(.init(top: 16, leading: 16, bottom: 16, trailing: 16))
                                }

                                Divider()
                                    .foregroundColor(Color.colorGrey200)
                                    .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))

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
                                            .padding(10)
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
                            .background(Color.colorGrey200)
                            .cornerRadius(12)
                            .padding()
                        }
                        .background(Color.colorGrey100)
                        .background(Color.colorGrey400)
                    }
                    .cornerRadius(12)
                }
                .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
                .background(Color.colorGrey000)
                .background(Color.colorGrey50)
            }
        }
    }

    private func generateText(by week: String) -> Text {
        return Text(week)
            .foregroundColor(.colorGrey50)
            .font(.pretendard(size: 14, type: .medium))
    }
}
