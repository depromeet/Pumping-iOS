//
//  ProfileRootView.swift
//  FeatureProfileInterface
//
//  Created by Derrick kim on 2023/06/06.
//

import SwiftUI
import ComposableArchitecture
import SharedDesignSystem

public struct ProfileRootView : View {
    public let store: StoreOf<ProfileRootStore>
    private let profileSubject: ProfileSubject

    public init(store: StoreOf<ProfileRootStore>, profileSubject: ProfileSubject) {
        self.store = store
        self.profileSubject = profileSubject
    }

    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationStack(path: viewStore.binding(\.$path)) {
                GeometryReader { geometry in
                    VStack(spacing: 0) {
                        VStack {
                            HStack {
                                VStack(alignment: .leading, spacing: 30) {

                                    ProfileHeaderView(profileSubject: profileSubject)

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

                                Spacer()
                            }
                            .padding(.leading, 20)
                            .overlay(alignment: .trailing) {
                                Image
                                    .boy
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
                                        sendWidthOfChangeOrComparisonButtonAction(by: viewStore)
                                    } label: {
                                        if profileSubject == .my {
                                            Text("변화폭")
                                                .font(.pretendard(size: 16, type: .semiBold))
                                                .padding(.init(top: 8 ,leading: 10, bottom: 8, trailing: 10))
                                                .foregroundColor(.white)
                                                .overlay(content: {
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .fill(Color.white.opacity(0.3))
                                                })
                                        } else {
                                            HStack {
                                                Image(systemName: "checkmark")
                                                    .frame(width: 15, height: 15)
                                                    .foregroundColor(viewStore.hasComparison ? .colorCyanPrimary : .colorGrey400)

                                                Text("나와비교")
                                                    .font(.pretendard(size: 15, type: .medium))
                                                    .foregroundColor(.colorGrey800)
                                            }
                                        }
                                    }
                                }
                                .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 20))

                                HStack {
                                    ForEachStore(self.store.scope(state: \.profileWeekDayList, action: ProfileRootStore.Action.profileWeekDayCell(id:action:))) {
                                        ProfileWeekDayCellView(store: $0)
                                    }
                                }
                                .padding()

                                VStack(alignment: .leading) {
                                    ProfileWorkoutTimeView(store: self.store)

                                    Divider()
                                        .foregroundColor(Color.colorGrey200)
                                        .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))

                                    HStack(spacing: 40) {
                                        ProfileHeartRateView(store: self.store)
                                        ProfileCalorieView(store: self.store)
                                    }

                                    Divider()
                                        .foregroundColor(Color.colorGrey200)
                                        .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))

                                    ProfileWorkoutDataView(store: self.store)
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
                .navigationDestination(for: ProfileScene.self) { scene in
                    switch scene {
                    case .widthOfChange:
                        IfLetStore(self.store.scope(state: \.widthOfChange, action: { .widthOfChange($0) })) {
                            WidthOfChangeView(store: $0)
                                .navigationBarTitleDisplayMode(.inline)
                                .toolbarRole(.editor)
                        }
                    default:
                        EmptyView()
                    }
                }
            }
        }
    }

    @discardableResult
    private func sendWidthOfChangeOrComparisonButtonAction(by viewStore: ViewStore<ProfileRootStore.State,
                                                           ProfileRootStore.Action>) -> ViewStoreTask {
        if profileSubject == .my {
            return viewStore.send(.tapWidthOfChangeButton)
        }

        return viewStore.send(.tapComparisonButton(!viewStore.hasComparison))
    }
}
