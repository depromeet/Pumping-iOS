//
//  ProfileView.swift
//  FeatureProfileInterface
//
//  Created by Derrick kim on 2023/06/18.
//

import SwiftUI
import ComposableArchitecture
import SharedDesignSystem

public struct ProfileView: View {
    public let store: StoreOf<ProfileStore>
    private let profileSubject: ProfileSubject
    
    public init(
        store: StoreOf<ProfileStore>,
        profileSubject: ProfileSubject
    ) {
        self.store = store
        self.profileSubject = profileSubject
    }
    
    public var body: some View {
        WithViewStore(self.store) { viewStore in
            ScrollView {
                headerView()
            }
        }
    }
    
    private func headerView() -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("5위")
                    .font(.pretendard(size: 13, type: .extraLight))
                    .foregroundColor(.colorGrey800)
                
                HStack(alignment: .center, spacing: 10) {
                    HStack {
                        Text("나")
                            .font(.pretendard(size: 16, type: .semiBold))
                            .foregroundColor(PumpingColors.colorGrey900.swiftUIColor)
                            .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 10))
                    }
                    .background(.white.opacity(0.3))
                    .cornerRadius(12)
                    
                    Text("보민")
                        .font(.tenada(size: 32))
                        .foregroundColor(.white)
                        .baselineOffset(-10)
                }
                
                Text("원래 영웅은\n성공전이 어두운법")
                    .font(.pretendard(size: 15, type: .light))
                    .foregroundColor(.colorGrey700)
                
                Button {
                    
                } label: {
                    PumpingImages.thumbsUp.swiftUIImage
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundColor(.black)
                }
                .frame(width: 60, height: 60)
                .background(.white)
                .clipShape(Circle())
            }
            
            PumpingImages.boy.swiftUIImage
                .resizable()
                .frame(width: 280, height: 220)
        }
    }
    
    private func weekView() -> some View {
        HStack {
            //TODO: 요일 리스트 뷰 만들기
        }
    }
    
    private func workoutSummaryView() -> some View {
        HStack {
            
        }
    }
    
    private func workoutSummaryItemView() -> some View {
        HStack {
            
        }
    }
}

//    public var body: some View {
//        WithViewStore(self.store) { viewStore in
//            GeometryReader { geometry in
//                ScrollView {
//                    VStack(spacing: 10) {
//                        VStack {
//                            HStack {
//                                VStack(alignment: .leading, spacing: 30) {
//
//                                    ProfileHeaderView(profileSubject: profileSubject)
//
//                                    Button {
//
//                                    } label: {
//                                        SharedDesignSystemAsset.Images.thumbsUp.swiftUIImage
//                                            .frame(maxWidth: .infinity, maxHeight: .infinity)
//                                            .foregroundColor(.black)
//                                    }
//                                    .frame(width: 60, height: 60)
//                                    .background(.white)
//                                    .clipShape(Circle())
//                                }
//
//                                Spacer()
//                            }
//                            .padding(.leading, 20)
//                            .overlay(alignment: .trailing) {
//                                Image
//                                    .boy
//                                    .resizable()
//                                    .frame(width: 280, height: 220)
//                                    .offset(x: 35, y: 10)
//                            }
//                        }
//                        .frame(height: geometry.size.height * 0.32)
//
//                        VStack {
//                            Spacer()
//                                .padding(.top, 15)
//
//                            HStack {
//                                Text("운동량")
//                                    .font(.pretendard(size: 18, type: .semiBold))
//
//                                Spacer()
//
//                                Button {
//                                    sendWidthOfChangeOrComparisonButtonAction(by: viewStore)
//                                } label: {
//                                    if profileSubject == .my {
//                                        Text("변화폭")
//                                            .font(.pretendard(size: 16, type: .semiBold))
//                                            .padding(.init(top: 8 ,leading: 10, bottom: 8, trailing: 10))
//                                            .foregroundColor(.white)
//                                            .overlay(content: {
//                                                RoundedRectangle(cornerRadius: 10)
//                                                    .fill(Color.white.opacity(0.3))
//                                            })
//                                    } else {
//                                        HStack {
//                                            Image(systemName: "checkmark")
//                                                .frame(width: 15, height: 15)
//                                                .foregroundColor(viewStore.hasComparison ? .colorCyanPrimary : .colorGrey400)
//
//                                            Text("나와비교")
//                                                .font(.pretendard(size: 15, type: .medium))
//                                                .foregroundColor(.colorGrey800)
//                                        }
//                                    }
//                                }
//                            }
//                            .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
//
//                            HStack {
//                                ForEachStore(self.store.scope(state: \.profileWeekDayList, action: ProfileStore.Action.profileWeekDayCell(id:action:))) {
//                                    ProfileWeekDayCellView(store: $0)
//                                }
//                            }
//                            .padding()
//
//                            VStack(alignment: .leading) {
//                                ProfileWorkoutTimeView(store: self.store)
//
//                                Divider()
//                                    .foregroundColor(Color.colorGrey200)
//                                    .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
//
//                                HStack(spacing: 40) {
//                                    ProfileHeartRateView(store: self.store)
//                                    ProfileCalorieView(store: self.store)
//                                }
//
//                                Divider()
//                                    .foregroundColor(Color.colorGrey200)
//                                    .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
//
//                                ProfileWorkoutDataView(store: self.store)
//                            }
//                            .background(Color.colorGrey200)
//                            .cornerRadius(12)
//                            .padding()
//                        }
//                        .background(Color.colorGrey100)
//                    }
//                    .cornerRadius(12)
//                }
//                .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
//                .background(Color.colorGrey50)
//            }
//        }
//    }
//
//    @discardableResult
//    private func sendWidthOfChangeOrComparisonButtonAction(by viewStore: ViewStoreOf<ProfileStore>) -> ViewStoreTask {
//        if profileSubject == .my {
//            return viewStore.send(.tapWidthOfChangeButton)
//        }
//
//        return viewStore.send(.tapComparisonButton(!viewStore.hasComparison))
//    }
//}
