//
//  CrewRankingView.swift
//  FeatureCrewInterface
//
//  Created by Derrick kim on 2023/06/15.
//

import SwiftUI
import ComposableArchitecture
import SharedDesignSystem

public struct CrewRankingView: View {
    public let store: StoreOf<CrewRankingStore>

    public init(
        store: StoreOf<CrewRankingStore>
    ) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ScrollView {
                VStack(spacing: 55) {
                    weekControlView(viewStore: viewStore)

                    rankingTabView()

                    VStack(alignment: .center, spacing: 10) {
                        Button {

                        } label: {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 23, height: 20)
                                .foregroundColor(.black)
                        }
                        .frame(width: 60, height: 60)
                        .background(.white)
                        .clipShape(Circle())

                        Text("응원보내기")
                            .font(.pretendard(size: 13, type: .medium))
                            .foregroundColor(Color.colorGrey600)
                    }
                    Spacer()
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Spacer()

                    Button {

                    } label: {
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .foregroundColor(Color.colorGrey700)
                            .frame(maxWidth: 25, maxHeight: 25)
                    }
                }
            }
        }
    }

    private func weekControlView(viewStore: ViewStoreOf<CrewRankingStore>) -> some View {
        HStack(spacing: 5) {
            Spacer()

            Button {

            } label: {
                Image(systemName: "arrowtriangle.left.fill")
                    .resizable()
                    .foregroundColor(Color.colorGrey700)
                    .frame(maxWidth: 10, maxHeight: 10)

            }

            Text("5월 12일 - 19일")
                .font(.pretendard(size: 15, type: .medium))
                .foregroundColor(Color.colorGrey700)

            Button {

            } label: {
                Image(systemName: "arrowtriangle.right.fill")
                    .resizable()
                    .foregroundColor(Color.colorGrey700)
                    .frame(maxWidth: 10, maxHeight: 10)
            }

            Spacer()
        }
    }

    @ViewBuilder
    private func rankingTabView() -> some View {
        TabView {
            ForEachStore(self.store.scope(
                state: \.crewRankingList,
                action: CrewRankingStore.Action.crewRankingCell(id:action:))) {
                    CrewRankingCellView(store: $0)
                }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(height: 400)
    }
}
