//
//  WorkoutTimerView.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/23.
//

import SwiftUI

import ComposableArchitecture

import FeatureWorkoutInterface

extension WorkoutTimerView: View {
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                //TODO: 타이머
                
                Text("타이머 뷰 입니다.")
                
                Spacer()
                
                Button("종료") {
                    viewStore.send(.endButtonTapped)
                }
            }
        }
    }
}
