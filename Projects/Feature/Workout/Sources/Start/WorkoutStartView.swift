//
//  WorkoutStartView.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/23.
//

import SwiftUI

import ComposableArchitecture

import FeatureWorkoutInterface
import SharedDesignSystem

extension WorkoutStartView: View {
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                Spacer()
                
                Rectangle()
                    .frame(height: 391)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                
                Spacer()
                
                Button(action: {
                    viewStore.send(.startButtonTapped)
                }, label: {
                    Text("운동시작")
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
        }
    }
}
