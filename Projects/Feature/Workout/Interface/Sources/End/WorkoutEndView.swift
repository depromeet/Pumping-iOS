//
//  WorkoutEndView.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/23.
//

import SwiftUI
import ComposableArchitecture
import Shared

public struct WorkoutEndView: View {
    public let store: StoreOf<WorkoutEndStore>
    
    public init(store: StoreOf<WorkoutEndStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                VStack {
                    titleView()
                        .padding(.top, 44)
                    
                    SharedDesignSystemAsset.Images.boy.swiftUIImage
                }
                .background(Color.colorCyan300)
                
                summaryView(viewStore: viewStore)
                    .padding()
                
                workoutListView(viewStore: viewStore)
                
                Spacer()
                
                PumpingSubmitButton(title: "완료", completion: {
                    viewStore.send(.completeButtonTapped)
                })
                .padding()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private func titleView() -> some View {
        VStack {
            HStack {
                Text("운동을 모두 끝냈어요!")
                    .font(.pretendard(size: 24, type: .bold))
                    .foregroundColor(SharedDesignSystemAsset.Colors.colorGrey100.swiftUIColor)
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, 12)
            
            HStack {
                Text("오늘 한 운동 세트를 기록할 수 있어요")
                    .font(.pretendard(size: 15, type: .medium))
                    .foregroundColor(.colorGrey000)
                
                Spacer()
            }
            .padding(.horizontal)
        }
    }
    
    private func summaryView(viewStore: ViewStoreOf<WorkoutEndStore>) -> some View {
        HStack {
            HStack {
                Spacer()
                
                VStack(spacing: 4) {
                    Text("오늘 운동 시간")
                        .font(.pretendard(size: 15, type: .medium))
                        .foregroundColor(.colorCyan300)
                    
                    Text(DateManager.toClockString(from: viewStore.state.totalTime))
                        .font(.pretendard(size: 24, type: .bold))
                        .foregroundColor(.colorGrey900)
                }
                
                Spacer()
                
                VStack(spacing: 4) {
                    Text("소모 칼로리")
                        .font(.pretendard(size: 15, type: .medium))
                        .foregroundColor(.colorCyan300)
                    
                    Text("\(viewStore.state.totalCalorie)kcal")
                        .font(.pretendard(size: 24, type: .bold))
                        .foregroundColor(.colorGrey900)
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.colorGrey100)
            .cornerRadius(12)
            .offset(.init(width: 0, height: -40))
        }
    }
    
    private func workoutListView(viewStore: ViewStoreOf<WorkoutEndStore>) -> some View {
        VStack {
            HStack {
                Text("오늘 한 운동")
                    .font(.pretendard(size: 18, type: .bold))
                    .foregroundColor(Color.colorGrey900)
                
                Spacer()
                
                Text("세트 기록")
                    .font(.pretendard(size: 16, type: .bold))
                    .foregroundColor(Color.colorGrey600)
            }
            .padding(.horizontal)
            
            VStack(spacing: 10) {
                ForEachStore(self.store.scope(state: \.timerSummaryCells, action: WorkoutEndStore.Action.timerSummaryCells(id:action:))) {
                    WorkoutTimerSummaryCellView(store: $0)
                }
            }
            .padding(.horizontal)
        }
    }
}
