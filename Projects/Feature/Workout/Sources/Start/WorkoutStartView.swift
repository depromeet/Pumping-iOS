//
//  WorkoutStartView.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/23.
//

import SwiftUI

import ComposableArchitecture

import FeatureWorkoutInterface

extension WorkoutStartView: View {
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                //TODO: 스타트 뷰 구현
                
                Text("스타트 뷰 입니다.")
                
                Spacer()
                
                Button("시작하기") {
                    viewStore.send(.startButtonTapped)
                }
            }
        }
    }
}
