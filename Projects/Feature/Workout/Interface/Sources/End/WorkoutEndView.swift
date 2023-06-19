//
//  WorkoutEndView.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/23.
//

import SwiftUI

import ComposableArchitecture

import SharedDesignSystem
import SharedUtil

public struct WorkoutEndView: View {
    public let store: StoreOf<WorkoutEndStore>
    
    public init(store: StoreOf<WorkoutEndStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                titleView()
                
                resultView(viewStore: viewStore)
                    .offset(.init(width: 0, height: -40))
                    .padding(.horizontal)
                
                workoutToolListView(viewStore: viewStore)
                
                Spacer()
                
                PumpingSubmitButton(title: "완료", completion: {
                    viewStore.send(.completeButtonTapped)
                })
                .padding()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    @ViewBuilder
    private func titleView() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("운동을 모두 끝냈어요!")
                .font(.pretendard(size: 24, type: .bold))
                .foregroundColor(PumpingColors.colorGrey100.swiftUIColor)
            
            Text("오늘 한 운동 세트를 기록할 수 있어요")
                .font(.pretendard(size: 15, type: .medium))
                .foregroundColor(PumpingColors.colorGrey000.swiftUIColor)
            
            SharedDesignSystemAsset.Images.boy.swiftUIImage
            
            HStack {
                Spacer()
            }
        }
        .padding(.horizontal)
        .background(Color.colorCyan300)
    }
    
    @ViewBuilder
    private func resultView(viewStore: ViewStoreOf<WorkoutEndStore>) -> some View {
        HStack {
            Spacer()
            
            VStack(spacing: 4) {
                Text("오늘 운동 시간")
                    .font(.pretendard(size: 15, type: .medium))
                    .foregroundColor(.colorCyan300)
                
                Text(DateManager.toClockString(from: viewStore.state.workoutTime))
                    .font(.pretendard(size: 24, type: .bold))
                    .foregroundColor(.colorGrey900)
            }
            
            Spacer()
            
            Divider()
                .frame(height: 54)
            
            Spacer()
            
            VStack(spacing: 4) {
                Text("소모 칼로리")
                    .font(.pretendard(size: 15, type: .medium))
                    .foregroundColor(.colorCyan300)
                
                Text("\(viewStore.state.workoutCalorie)kcal")
                    .font(.pretendard(size: 24, type: .bold))
                    .foregroundColor(.colorGrey900)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.colorGrey100)
        .cornerRadius(12)
    }
    
    @ViewBuilder
    private func workoutToolListView(viewStore: ViewStoreOf<WorkoutEndStore>) -> some View {
        VStack {
            HStack {
                Text("오늘 한 운동 기구")
                    .font(.pretendard(size: 18, type: .bold))
                    .foregroundColor(Color.colorGrey900)
                
                Spacer()
                
                Text("세트 기록")
                    .font(.pretendard(size: 16, type: .bold))
                    .foregroundColor(Color.colorGrey600)
                
                Button(action: {
                    viewStore.send(.editButtonTapped)
                }, label: {
                    Image(systemName: "highlighter")
                        .imageScale(.medium)
                        .foregroundColor(.colorCyan300)
                })
            }
            
            ForEachStore(self.store.scope(state: \.workoutToolCells, action: WorkoutEndStore.Action.pumpingTextCell(id:action:))) {
                PumpingTextCellView(store: $0)
            }
        }
        .padding(.horizontal)
    }
}
