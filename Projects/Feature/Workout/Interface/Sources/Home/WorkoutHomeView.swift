//
//  WorkoutHomeView.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/06/06.
//

import SwiftUI

import ComposableArchitecture

import SharedDesignSystem

public struct WorkoutHomeView : View {
    public let store: StoreOf<WorkoutHomeStore>
    
    public init(store: StoreOf<WorkoutHomeStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ScrollView(showsIndicators: false) {
                VStack(spacing: .zero) {
                    titleView()
                    
                    workoutCategoryListView(viewStore: viewStore)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    PumpingSubmitButton(title: "다음", isEnable: !viewStore.selectedWorkoutCategoryIdentifiers.isEmpty, completion: {
                        viewStore.send(.startButtonTapped)
                    })
                    .padding(.horizontal)
                    .padding(.bottom, 30)
                }
            }
            .navigationBarBackButtonHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.colorGrey100)
        }
    }
    
    private func titleView() -> some View {
        VStack(spacing: .zero) {
            HStack {
                Text("어떤 운동을 할 예정인가요?")
                    .font(.pretendard(size: 24, type: .bold))
                    .foregroundColor(PumpingColors.colorGrey900.swiftUIColor)
                
                Spacer()
            }
            .padding(.top, 48)
            .padding(.horizontal)
            .padding(.bottom, 12)
            
            HStack {
                Text("오늘 할 운동을 모두 선택해 주세요")
                    .font(.pretendard(size: 15, type: .medium))
                    .foregroundColor(.colorGrey600)
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, 40)
        }
    }
    
    private func workoutCategoryListView(viewStore: ViewStoreOf<WorkoutHomeStore>) -> some View {
        VStack(spacing: .zero) {
            ForEach(Array(viewStore.state.workoutCategoryCellZip.keys), id: \.self) { type in
                HStack {
                    Text(type.title)
                    
                    Spacer()
                }
                
                VStack(spacing: 8) {
                    ForEachStore(self.store.scope(state: { $0.workoutCategoryCellZip[type] ?? [] }, action: WorkoutHomeStore.Action.workoutCategoryCell(id:action:))) {
                        WorkoutCategoryCellView(store: $0)
                    }
                }
                .padding(.top, 12)
                .padding(.bottom, 32)
            }
        }
    }
}
