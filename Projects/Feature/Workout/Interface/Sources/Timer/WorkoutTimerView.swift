//
//  WorkoutTimerView.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/23.
//

import SwiftUI

import ComposableArchitecture

import SharedDesignSystem

public struct WorkoutTimerView: View {
    public let store: StoreOf<WorkoutTimerStore>
    
    public init(store: StoreOf<WorkoutTimerStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            IfLetStore(
                store.scope(state: \.counter, action: { .counter($0) }),
                then: {
                    WorkoutCounterView(store: $0)
                },
                else: {
                    timerView(viewStore: viewStore)
                }
            )
        }
    }
    
    @ViewBuilder
    private func timerCellListView(viewStore: ViewStoreOf<WorkoutTimerStore>) -> some View {
        ScrollView(.horizontal) {
            HStack {
                ForEachStore(self.store.scope(state: \.timerCells, action: WorkoutTimerStore.Action.timerCell(id:action:))) {
                    TimerCellView(store: $0)
                }
            }
            .padding(.bottom, 24)
        }
    }
    
    @ViewBuilder
    private func timerView(viewStore: ViewStoreOf<WorkoutTimerStore>) -> some View {
        VStack {
            VStack {
                HStack {
                    Text("운동 목록")
                        .font(.pretendard(size: 24, type: .bold))
                        .foregroundColor(.colorGrey900)
                    
                    Spacer()
                }
                .padding(.bottom, 22)
                .padding(.horizontal)
                
                timerCellListView(viewStore: viewStore)
                    .padding(.leading)
            }
            .frame(maxWidth: .infinity)
            .cornerRadius(12)
            .background(Color.colorGrey100)
            
            Text("총시간")
                .font(.pretendard(size: 16, type: .bold))
                .padding(.top, 60)
            
            Text("00:00:40")
                .font(.pretendard(size: 56, type: .extraBold))
            
            Text("심박수")
                .font(.pretendard(size: 16, type: .bold))
                .padding(.top, 32)
            
            Text("100bpm")
                .font(.pretendard(size: 56, type: .extraBold))
            
            Text("총 칼로리")
                .font(.pretendard(size: 16, type: .bold))
                .padding(.top, 32)
            
            Text("230Kcal")
                .font(.pretendard(size: 56, type: .extraBold))
                .padding(.bottom, 44)
            
            Spacer()
            
            Button(action: {
                viewStore.send(.endButtonTapped)
            }, label: {
                Text("종료")
                    .font(.pretendard(size: 18, type: .bold))
                    .foregroundColor(.colorGrey000)
                    .frame(maxWidth: .infinity)
                    .frame(height: 52)
            })
            .background(Color.colorCyan300)
            .cornerRadius(12)
            .padding(.horizontal)
            .padding(.bottom, 34)
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity)
        .background(Color.colorGrey000)
    }
    
    
    @ViewBuilder
    private func counterView(viewStore : ViewStoreOf<WorkoutTimerStore>) -> some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                Text("1")
                
                Spacer()
            }
            
            Spacer()
        }
    }
}
