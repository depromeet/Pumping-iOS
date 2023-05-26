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
                .padding(.horizontal)
                .padding(.bottom, 12)
                
                HStack {
                    Text("오늘 할 운동을 모두 선택해 주세요")
                        .font(.pretendard(size: 15, type: .medium))
                        .foregroundColor(.colorGrey600)
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                Text("전신")
                
                ForEach(0...2, id: \.self) { i in
                    HStack {
                        Text("유산소")
                    }
                }
                
                Spacer()
                
                Button("시작하기") {
                    viewStore.send(.startButtonTapped)
                }
                .padding(.bottom, 4)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.colorGrey100)
        }
    }
}
