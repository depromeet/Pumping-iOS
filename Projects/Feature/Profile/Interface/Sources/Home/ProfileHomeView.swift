//
//  ProfileView.swift
//  FeatureProfileInterface
//
//  Created by Derrick kim on 2023/06/18.
//

import SwiftUI
import ComposableArchitecture
import SharedDesignSystem

public struct ProfileHomeView: View {
    public let store: StoreOf<ProfileHomeStore>
    
    public init(store: StoreOf<ProfileHomeStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store) { viewStore in
            ScrollView {
                VStack(spacing: .zero) {
                    headerView()
                    
                    workoutBottomView(viewStore: viewStore)
                        .frame(maxHeight: .infinity)
                        .background(PumpingColors.colorGrey100.swiftUIColor)
                    
                    Button(action: {
                        viewStore.send(.tapWithdrawButton)
                    }, label: {
                        Text("계정 탈퇴하기")
                            .font(.pretendard(size: .body2))
                            .foregroundColor(PumpingColors.colorGrey500.swiftUIColor)
                    })
                    .padding(.bottom, 40)
                }
                .frame(maxHeight: .infinity)
            }
            .background(makeBackgroundView())
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
    
    private func makeBackgroundView() -> some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color.colorBlue500)
                    .frame(height: (geometry.size.height / 2) + 100)
                    .edgesIgnoringSafeArea(.top)
                
                Rectangle()
                    .fill(Color.colorGrey100)
                    .frame(height: geometry.size.height / 2)
            }
            .frame(height: geometry.size.height)
        }
    }
    
    private func headerView() -> some View {
        HStack(alignment: .bottom) {
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
                    
                    Text("채령")
                        .modifier(TenadaFont(size: .h2))
                        .foregroundColor(.white)
                }
                
                Text("원래 영웅은 성공전이 어두운법")
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
                .padding(.bottom, 24)
            }
            
            Spacer()
            
            PumpingImages.boy.swiftUIImage
        }
        .padding(.horizontal)
    }
    
    private func workoutBottomView(viewStore: ViewStoreOf<ProfileHomeStore>) -> some View {
        VStack(spacing: .zero) {
            workoutSummaryHeaderView(viewStore: viewStore)
                .padding()
            
            weekView()
                .padding(.horizontal)
            
            workoutSummaryView(viewStore: viewStore)
                .background(PumpingColors.colorGrey200.swiftUIColor)
                .cornerRadius(12)
                .padding()
            
            Spacer()
        }
        .frame(maxHeight: .infinity)
    }
    
    private func workoutSummaryView(viewStore: ViewStoreOf<ProfileHomeStore>) -> some View {
        VStack {
            HStack {
                workoutSummaryItemView(type: .time(viewStore.state.time))
                Spacer()
            }
            .padding(.bottom, 43)
            
            Divider()
            
            HStack {
                workoutSummaryItemView(type: .heartRate(viewStore.state.heartRate))
                Spacer()
                workoutSummaryItemView(type: .calorie(viewStore.state.calorie))
            }
            .padding(.bottom, 43)
            
            Divider()
            
            HStack {
                workoutSummaryItemView(type: .maxWorkout(viewStore.state.maxWorkoutCategory, viewStore.state.maxWorkoutTime))
                Spacer()
            }
            .padding(.bottom, 43)
        }
        .padding()
    }
    
    private func workoutSummaryHeaderView(viewStore: ViewStoreOf<ProfileHomeStore>) -> some View {
        HStack {
            Text("운동량")
                .font(.pretendard(size: .h4))
            
            Spacer()
            
            switch viewStore.type {
            case .my:
                HStack {
                    Button("나와 비교") {
                        viewStore.send(.tapMyButton)
                    }
                }
                
            case .other:
                HStack {
                    Button("변화폭") {
                        viewStore.send(.tapWidthOfChangeButton)
                    }
                }
            }
        }

    }
    
    private func weekView() -> some View {
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = Locale(identifier: "ko_kr")
        
        return HStack {
            ForEach(calendar.shortWeekdaySymbols, id: \.self) { weekday in
                VStack {
                    Text("n일차")
                        .font(.pretendard(size: 10, type: .light))
                        .foregroundColor(.colorGrey900)
                        .padding(.init(top: 7, leading: 6, bottom: 0, trailing: 6))

                    Circle()
                        .fill(Color.colorCyanPrimary)
                        .padding(.init(top: 4, leading: 6, bottom: 6, trailing: 6))
                        .overlay(alignment: .center) {
                            Text(weekday)
                                .foregroundColor(.colorGrey50)
                                .font(.pretendard(size: 14, type: .medium))
                                .multilineTextAlignment(.center)
                        }
                }
            }
        }
    }
    
    private func workoutSummaryItemView(type: ProfileHomeStore.WorkoutSummaryType, myType: ProfileHomeStore.WorkoutSummaryType? = nil) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack(spacing: 2) {
                type.icon
                    .resizable()
                    .frame(width: 18, height: 18)
                
                Text(type.title)
                    .font(.pretendard(size: .body1))
                    .foregroundColor(PumpingColors.colorGrey900.swiftUIColor)
            }
            
            HStack(spacing: 4) {
                Text(type.value)
                    .modifier(TenadaFont(size: .h2))
                    .foregroundColor(type.color)
                
                Text(type.prefix)
                    .modifier(TenadaFont(size: .h5))
                    .foregroundColor(type.color)
            }
            
            if let myType = myType {
                HStack {
                    Text(String(describing: "\(myType.value) \(myType.prefix)"))
                }
            }
        }
    }
}
