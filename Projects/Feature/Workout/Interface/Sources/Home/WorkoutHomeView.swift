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
            VStack(spacing: .zero) {
                titleView()
                
                workoutCategoryListView(viewStore: viewStore)
                    .padding(.horizontal)
                
                Spacer()
                
                PumpingSubmitButton(title: "다음", completion: {
                    viewStore.send(.startButtonTapped)
                })
                .padding(.horizontal)
            }
            .navigationBarBackButtonHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.colorGrey100)
        }
    }
    
    @ViewBuilder
    private func titleView() -> some View {
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
    
    @ViewBuilder
    private func workoutCategoryListView(viewStore: ViewStoreOf<WorkoutHomeStore>) -> some View {
        VStack(spacing: .zero) {
            ForEach(Array(viewStore.state.workoutCategoryZip.keys), id: \.self) { type in
                HStack {
                    Text(type.rawValue)
                    
                    Spacer()
                }
                
                VStack(spacing: 8) {
                    ForEachStore(self.store.scope(state: { $0.workoutCategoryZip[type] ?? [] }, action: WorkoutHomeStore.Action.pumpingTextCell(id:action:))) {
                        PumpingTextCellView(store: $0)
                    }
                }
                .padding(.top, 12)
                .padding(.bottom, 32)
            }
        }
    }
}
