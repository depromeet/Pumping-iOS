//
//  WorkoutEndView.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/23.
//

import SwiftUI

import ComposableArchitecture

import FeatureWorkoutInterface

extension WorkoutEndView: View {
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                //TODO: End View 구현
                
                Spacer()
                
                Button("시작하기") {
                    viewStore.send(.startButtonTapped)
                }
            }
        }
    }
}
