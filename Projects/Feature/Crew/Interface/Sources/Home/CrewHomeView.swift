//
//  CrewHomeView.swift
//  FeatureCrewInterface
//
//  Created by Derrick kim on 2023/06/13.
//

import SwiftUI
import ComposableArchitecture
import SharedDesignSystem

import Core

public struct CrewHomeView: View {
    public let store: StoreOf<CrewHomeStore>
    
    public init(store: StoreOf<CrewHomeStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store) { viewStore in
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    if viewStore.profileList.isEmpty {
                        emptyProfileTabView(viewStore: viewStore)
                    } else {
                        profileNavigationView(viewStore: viewStore)
                        profileTabView(viewStore: viewStore)
                    }
                    
                    crewRankingView(viewStore: viewStore)
                }
            }
            .background(makeBackgroundView())
            .refreshable {
                viewStore.send(.fetchCrewRequest)
            }
            .basicBottomSheet(isPresented: viewStore.binding(\.$showCrewListView),
                              detents: [.height(500)]
            ) {
                CrewListView(store: store)
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
            .fullScreenCover(isPresented: viewStore.binding(\.$showCrewJoinView)) {
                IfLetStore(store.scope(state: \.crewJoin, action: { .crewJoin($0) })) {
                    CrewJoinView(store: $0)
                }
            }
            .fullScreenCover(isPresented: viewStore.binding(\.$showCrewMakeView)) {
                IfLetStore(store.scope(state: \.crewMake, action: { .crewMake($0) })) {
                    CrewMakeView(store: $0)
                }
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
    
    private func emptyProfileTabView(viewStore: ViewStoreOf<CrewHomeStore>) -> some View {
        VStack(alignment: .center, spacing: .zero) {
            Text("운동 크루에 참여해주세요")
                .font(.pretendard(size: .h2))
                .foregroundColor(PumpingColors.colorGrey900.swiftUIColor)
                .padding(.top, 44)
            
            Text("크루는 최대 5명까지 참여 가능해요")
                .font(.pretendard(size: .body1))
                .foregroundColor(PumpingColors.colorGrey800.swiftUIColor)
                .padding(.top, 12)
            
            Spacer()
            
            PumpingImages.imgEmptyCrew.swiftUIImage
                .resizable()
                .frame(width: 246, height: 233)
            
            Spacer()
            
            HStack {
                PumpingSubmitButton(title: "코드로 참여하기") {
                    viewStore.send(.tapCrewJoinButton)
                }
                Spacer()
                PumpingSubmitButton(title: "크루 만들기") {
                    viewStore.send(.tapCrewMakeButton)
                }
            }
            .padding()
        }
        .background(Color.colorBlue300)
        .frame(height: 520)
    }
    
    private func profileNavigationView(viewStore: ViewStoreOf<CrewHomeStore>) -> some View {
        HStack {
            Button {
                viewStore.send(.presentCrewListView)
            } label: {
                HStack(spacing: 5) {
                    Text(viewStore.crewName ?? "")
                        .font(.pretendard(size: 18, type: .semiBold))
                        .foregroundColor(.colorGrey900)
                    
                    SharedDesignSystemAsset.Images.dropdown.swiftUIImage
                }
            }
            
            Spacer()
        }
        .background(Color.colorBlue300)
        .padding(.init(top: 20, leading: 15, bottom: 0, trailing: 20))
    }
    
    private func workoutMessageView(viewStore: ViewStoreOf<CrewHomeStore>) -> some View {
        HStack(spacing: 5) {
            SharedDesignSystemAsset.Images.loudSpeaker.swiftUIImage
            
            Text(viewStore.crewMessage ?? "")
                .font(.pretendard(size: 15, type: .medium))
                .foregroundColor(.colorGrey900)
            
            Spacer()
        }
        .padding(.init(top: 5, leading: 15, bottom: 5, trailing: 0))
        .background(Color.black.opacity(0.3))
    }
    
    
    private func profileTabView(viewStore: ViewStoreOf<CrewHomeStore>) -> some View {
        VStack {
            TabView {
                ForEachStore(self.store.scope(
                    state: \.profileList,
                    action: CrewHomeStore.Action.profileBodyCell(id:action:))) {
                        ProfileBodyCellView(store: $0)
                    }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            workoutMessageView(viewStore: viewStore)
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
                    PersonalRecordCellView(store: $0, firstItem: viewStore.userRecordList.first)
                }
        }
    }
}
