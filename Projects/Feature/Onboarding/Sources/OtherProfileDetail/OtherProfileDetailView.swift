//
//  OtherProfileDetailView.swift
//  FeatureOnboarding
//
//  Created by 김태현 on 2023/05/12.
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
                                ProfileHeaderView()

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
                                .padding(.top, 15)

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

                            ProfileWeekDaysView()

                            VStack(alignment: .leading) {
                                ProfileWorkoutTimeView()

                                Divider()
                                    .foregroundColor(Color.colorGrey200)
                                    .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))

                                HStack(spacing: 40) {
                                    ProfileHeartRateView()
                                    ProfileCalorieView()
                                }

                                Divider()
                                    .foregroundColor(Color.colorGrey200)
                                    .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))

                                ProfileWorkoutDataView()
                            }
                            .background(Color.colorGrey200)
                            .cornerRadius(12)
                            .padding()
                        }
                        .background(Color.colorGrey100)
                    }
                    .cornerRadius(12)
                }
                .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
                .background(Color.colorGrey50)
            }
        }
    }
}
