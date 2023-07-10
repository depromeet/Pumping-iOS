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
                VStack(spacing: 0) {
                    profileNavigationView(viewStore: viewStore)
                    
                    profileTabView()
                    
                    crewRankingView(viewStore: viewStore)
                }
            }
            .background(makeBackgroundView())
            .refreshable {
                viewStore.send(.fetchCrew)
            }
            .basicBottomSheet(isPresented: viewStore.binding(\.$showCrewListView),
                              detents: [.height(500)]
            ) {
                CrewListView(store: store)
            }
            .navigationBarHidden(true)
        }
    }
    
    private func makeBackgroundView() -> some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color.colorBlue300)
                    .frame(height: (geometry.size.height / 2) + 100)
                    .edgesIgnoringSafeArea(.top)
                
                Rectangle()
                    .fill(Color.colorGrey000)
                    .frame(height: geometry.size.height / 2)
            }
            .frame(height: geometry.size.height)
        }
    }
    
    private func profileNavigationView(viewStore: ViewStoreOf<CrewHomeStore>) -> some View {
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
        .background(Color.colorBlue300)
        .padding(.init(top: 20, leading: 15, bottom: 0, trailing: 20))
    }
    
    private func workoutMessageView() -> some View {
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
    
    
    private func profileTabView() -> some View {
        VStack {
            TabView {
                ForEachStore(self.store.scope(
                    state: \.profileList,
                    action: CrewHomeStore.Action.profileBodyCell(id:action:))) {
                        ProfileBodyCellView(store: $0)
                    }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            workoutMessageView()
        }
        
        .background(Color.colorBlue300)
        .frame(height: 400)
        
    }
    
    private func crewRankingView(viewStore: ViewStoreOf<CrewHomeStore>) -> some View {
        VStack(spacing: 0) {
            HStack {
                Text("크루 인원")
                    .font(.pretendard(size: 18, type: .semiBold))
                    .foregroundColor(.colorGrey900)
                
                Spacer()
            }
            
            crewRankingListView(viewStore: viewStore)
        }
        .padding(EdgeInsets(top: 30, leading: 15, bottom: 50, trailing: 15))
        .background(Color.colorGrey000)
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
        }
    }
}
