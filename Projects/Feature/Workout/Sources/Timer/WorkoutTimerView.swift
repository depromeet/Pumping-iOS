//
//  WorkoutTimerView.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/23.
//

import SwiftUI

import ComposableArchitecture

import FeatureWorkoutInterface
import SharedDesignSystem

extension WorkoutTimerView: View {
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                Text("타이머 뷰 입니다.")
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEachStore(self.store.scope(state: \.timerCells, action: WorkoutTimerStore.Action.timerCell(id:action:))) {
                            TimerCellView(store: $0)
                        }
                    }
                }
                
                Spacer()
                
                Button("종료") {
                    viewStore.send(.endButtonTapped)
                }
            }
        }
    }
}
