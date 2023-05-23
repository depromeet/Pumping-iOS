//
//  WorkoutHomeView.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/23.
//

import SwiftUI

import ComposableArchitecture

import FeatureWorkoutInterface

extension WorkoutHomeView: View {
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                Text("어떤 운동을 할 예정인가요?")
                
                Text("오늘 할 운동을 모두 선택해 주세요")
                
                Text("전신")
                
                ForEach(0...2, id: \.self) { i in
                    HStack {
                        Text("유산소")
                    }
                }
                
                Button("시작하기") {
                    viewStore.send(.startButtonTapped)
                }
            }
        }
    }
}
