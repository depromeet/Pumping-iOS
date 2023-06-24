//
//  CrewHomeView.swift
//  FeatureCrewInterface
//
//  Created by Derrick kim on 2023/06/13.
//

import SwiftUI
import ComposableArchitecture
import SharedDesignSystem

public struct CrewHomeView: View {
    public let store: StoreOf<CrewHomeStore>
    
    public init(
        store: StoreOf<CrewHomeStore>
    ) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store) { viewStore in
            ScrollView(showsIndicators: false) {
                VStack(spacing: 35) {
                    profileView(viewStore: viewStore)
                    
                    crewRankingView(viewStore: viewStore)
                }
            }
            .refreshable {
                print("Refresh")
            }
            .basicBottomSheet(isPresented: viewStore.binding(\.$showCrewListView),
                              detents: [.height(500)]
            ) {
                CrewListView(store: store)
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
    
    private func profileView(viewStore: ViewStoreOf<CrewHomeStore>) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading) {
                Spacer()
                    .frame(height: 55)
                
                profileHeaderView(viewStore: viewStore)
                
                Spacer()
                
                profileTabView()
            }
            .edgesIgnoringSafeArea(.top)
            
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
    }
    
    private func profileHeaderView(viewStore: ViewStoreOf<CrewHomeStore>) -> some View {
        HStack {
            Button {
                viewStore.send(.presentCrewListView)
            } label: {
                HStack(spacing: 5) {
                    Text("일이삼사오육칠팔구십")
                        .font(.pretendard(size: 18, type: .semiBold))
                        .foregroundColor(.colorGrey900)
                    
                    SharedDesignSystemAsset.Images.dropdown.swiftUIImage
                }
            }
            
            Spacer()
            
            Text("D-7")
                .font(.pretendard(size: 21, type: .semiBold))
                .foregroundColor(.colorCyan200)
        }
        .padding(.init(top: 20, leading: 15, bottom: 0, trailing: 20))
    }
    
    private func profileTabView() -> some View {
        TabView {
            ForEachStore(self.store.scope(
                state: \.profileList,
                action: CrewHomeStore.Action.profileBodyCell(id:action:))) {
                    ProfileBodyCellView(store: $0)
                }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(height: 400)
    }
    
    
    private func crewRankingHeaderView(viewStore: ViewStoreOf<CrewHomeStore>) -> some View {
        HStack {
            Text("크루 인원")
                .font(.pretendard(size: 18, type: .semiBold))
                .foregroundColor(.colorGrey900)
            
            Spacer()
            
            Button {
                viewStore.send(.goToCrewRankingView)
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
    
    private func crewRankingView(viewStore: ViewStoreOf<CrewHomeStore>) -> some View {
        VStack(spacing: 0) {
            crewRankingHeaderView(viewStore: viewStore)
            
            crewRankingListView(viewStore: viewStore)
        }
        .padding(.bottom, 35)
    }
    
    private func crewRankingListView(viewStore: ViewStoreOf<CrewHomeStore>) -> some View {
        VStack(spacing: 0) {
            ForEachStore(self.store.scope(
                state: \.userRecordList,
                action: CrewHomeStore.Action.personalRecordCell(id:action:))) {
                    PersonalRecordCellView(store: $0)
                        .onTapGesture {
                            viewStore.send(.goToProfileView)
                        }
                }
            
            Button {
                
            } label: {
                Text("크루 나가기")
                    .font(.pretendard(size: 14, type: .medium))
                
                    .foregroundColor(Color.colorGrey500)
            }
            .padding(.top, 48)
            .padding(.bottom, 35)
        }
    }
}
