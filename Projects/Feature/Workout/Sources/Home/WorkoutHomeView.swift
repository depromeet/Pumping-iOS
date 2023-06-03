//
//  WorkoutHomeView.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/23.
//

import SwiftUI

import ComposableArchitecture

import FeatureWorkoutInterface
import SharedDesignSystem

extension WorkoutHomeView: View {
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(spacing: .zero) {
                HStack {
                    Text("어떤 운동을 할 예정인가요?")
                        .font(.pretendard(size: 24, type: .bold))
                        .foregroundColor(.colorGrey900)
                    
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
                
                VStack(spacing: .zero) {
                    ForEach(Array(viewStore.state.workoutMenuList.enumerated()), id: \.offset) { index, cells in
                        HStack {
                            Text(["전신", "상체", "하체"][index])
                            
                            Spacer()
                        }
                        
                        VStack(spacing: 8) {
                            ForEachStore(self.store.scope(state: \.workoutMenuList[index], action: WorkoutHomeStore.Action.pumpingTextCell(id:action:))) {
                                PumpingTextCellView(store: $0)
                            }
                        }
                        .padding(.top, 12)
                        .padding(.bottom, 32)
                    }
                }
                .padding(.horizontal)
                
                Spacer()

                Button(action: {
                    viewStore.send(.startButtonTapped)
                }, label: {
                    Text(PumpingButtonStyle.start.title)
                        .modifier(PumpingButtonTextStyleModifier(style: .start))
                })
                .modifier(PumpingButtonStyleModifier(style: .start))
            }
            .navigationBarBackButtonHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.colorGrey100)
        }
    }
}
