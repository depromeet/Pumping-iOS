//
//  CrewRankingCellView.swift
//  SharedDesignSystem
//
//  Created by Derrick kim on 2023/06/22.
//

import SwiftUI
import ComposableArchitecture

public struct CrewRankingCellView: View {
    public let store: StoreOf<CrewRankingCellStore>

    public init(store: StoreOf<CrewRankingCellStore>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                Spacer()

                CrewRankingType(rawValue: viewStore.title)?.backgroundImage
                    .resizable()
                    .frame(height: 180)
                    .offset(y: -40)
                    .overlay(content: {
                        VStack(alignment: .leading) {
                            rankingHeaderView(viewStore: viewStore)
                                .offset(y: -200)

                            if CrewRankingType(rawValue: viewStore.title) == .workoutCumulativeTime {
                                Text("07 : 43 : 29")
                                    .font(.tenada(size: 28))
                                    .baselineOffset(-5)
                                    .foregroundColor(.colorGrey900)
                                    .offset(x: 15, y: -65)
                            } else {
                                VStack(alignment: .leading) {
                                    HStack {
                                        Image.clock
                                            .resizable()
                                            .frame(width: 16, height: 16)
                                        Text(viewStore.data[0])
                                            .font(.pretendard(size: 14, type: .medium))
                                            .foregroundColor(Color.colorGrey900)
                                    }

                                    HStack {
                                        Image.strongArm
                                            .resizable()
                                            .frame(width: 16, height: 16)

                                        Text(viewStore.data[1])
                                            .font(.pretendard(size: 14, type: .medium))
                                            .foregroundColor(Color.colorGrey900)
                                    }
                                }
                                .offset(x: 15, y: -65)
                            }
                        }

                        ZStack {
                            CrewRankingType(rawValue: viewStore.title)?.avatar
                                .resizable()
                                .frame(
                                    width: CrewRankingType(rawValue: viewStore.title) == .workoutCumulativeTime ? 200: 230,
                                    height: CrewRankingType(rawValue: viewStore.title) == .workoutCumulativeTime ? 250: 330
                                )
                                .offset(x: 80, y: -130)
                        }
                    })
            }
        }
    }

    private func rankingHeaderView(viewStore: ViewStoreOf<CrewRankingCellStore>) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 45) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(viewStore.title)
                        .font(.tenada(size: 36))
                        .baselineOffset(-5)
                        .foregroundColor(.white)

                    HStack {
                        HStack {
                            Text("\(viewStore.ranking)위")
                                .font(.pretendard(size: 16, type: .medium))
                                .padding(.init(top: 2 ,leading: 10, bottom: 2, trailing: 10))
                                .foregroundColor(Color.colorGrey900)
                        }
                        .background(Color.colorCyan100)
                        .cornerRadius(13)

                        Text(viewStore.userName)
                            .font(.pretendard(size: 18, type: .bold))
                            .foregroundColor(Color.colorGrey900)
                    }
                }

                Button {

                } label: {
                    Text("다른 친구는?")
                        .font(.pretendard(size: 16, type: .bold))
                        .padding(.init(top: 8 ,leading: 10, bottom: 8, trailing: 10))
                        .foregroundColor(.white)
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white.opacity(0.3))
                        })
                }
            }
            .padding(.leading, 15)

            Spacer()
        }
    }
}
