//
//  HomeRootView.swift
//  FeatureHomeInterface
//
//  Created by Derrick kim on 2023/06/13.
//

import SwiftUI
import ComposableArchitecture
import SharedDesignSystem

public struct HomeRootView: View {
    public let store: StoreOf<HomeRootStore>

    public init(store: StoreOf<HomeRootStore>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationStack(path: viewStore.binding(\.$path)) {
                ScrollView {
                    VStack(spacing: 35) {
                        VStack(alignment: .leading, spacing: 0) {
                            VStack(alignment: .leading) {
                                HStack {
                                    HStack(spacing: 5) {
                                        Text("일이삼사오육칠팔구십")
                                            .font(.pretendard(size: 18, type: .semiBold))
                                            .foregroundColor(.colorGrey900)

                                        Button {

                                        } label: {
                                            SharedDesignSystemAsset.Images.dropdown.swiftUIImage
                                        }
                                    }

                                    Spacer()

                                    Text("D-7")
                                        .font(.pretendard(size: 21, type: .semiBold))
                                        .foregroundColor(.colorCyan200)
                                }

                                Spacer()

                                TabView {
                                    recordItemHeaderListView()
                                }
                                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                                .frame(height: 400)
                            }
                            .padding(.init(top: 20, leading: 15, bottom: 0, trailing: 20))

                            HStack(spacing: 5) {
                                SharedDesignSystemAsset.Images.loudSpeaker.swiftUIImage

                                Text("중요한건 꺾였는데도 그냥 하는 마음임")
                                    .font(.pretendard(size: 15, type: .medium))
                                    .foregroundColor(.colorGrey900)

                                Spacer()
                            }
                            .padding(.init(top: 5, leading: 15, bottom: 5, trailing: 0))
                            .background(Color.black.opacity(0.3))
                        }
                        .background(Color.colorBlue300)

                        HStack {
                            Text("이번 주 순위")
                                .font(.pretendard(size: 18, type: .semiBold))
                                .foregroundColor(.colorGrey900)

                            Spacer()

                            Button {

                            } label: {
                                Text("랭킹")
                                    .font(.pretendard(size: 16, type: .semiBold))
                                    .padding(.init(top: 8 ,leading: 10, bottom: 8, trailing: 10))
                                    .foregroundColor(.white)
                                    .overlay(content: {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.white.opacity(0.3))
                                    })
                            }

                        }
                        .padding(.init(top: 0, leading: 15, bottom: 0, trailing: 15))
                    }
                }
            }
        }
    }

    func recordItemHeaderView() -> some View {
        HStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 40) {
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading) {
                        Text("5위")
                            .font(.pretendard(size: 13, type: .medium))
                            .foregroundColor(.colorGrey800)

                        Text("보민")
                            .font(.tenada(size: 32))
                            .foregroundColor(.colorGrey900)
                            .baselineOffset(-5)
                    }

                    VStack(alignment: .leading) {
                        Text("운동 시간")
                            .font(.pretendard(size: 13, type: .medium))
                            .foregroundColor(.colorGrey800)

                        Text("00:34:00")
                            .font(.tenada(size: 32))
                            .foregroundColor(.colorGrey900)
                            .baselineOffset(-5)
                    }
                }

                Button {

                } label: {
                    Image(systemName: "heart.fill")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundColor(.black)
                }
                .frame(width: 50, height: 50)
                .background(.white)
                .clipShape(Circle())
            }
            .offset(x: -10)

            SharedDesignSystemAsset.Images.avatar.swiftUIImage
        }
    }

    func recordItemHeaderListView() -> some View {
        ForEach(0..<5) { i in
            recordItemHeaderView()
        }
    }
}
