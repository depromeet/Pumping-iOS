//
//  WorkoutSummaryCellView.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/07/02.
//

import SwiftUI
import ComposableArchitecture
import Shared

import SwiftUI

import ComposableArchitecture

import Shared

public struct WorkoutTimerSummaryCellView: View {
    public let store: StoreOf<WorkoutTimerSummaryCellStore>
    
    public init(store: StoreOf<WorkoutTimerSummaryCellStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            HStack {
                Text(viewStore.state.timer.workoutCategoryIdentifier.title)
                    .font(.pretendard(size: 15, type: .medium))
                    .padding([.top, .bottom], 16)
                    .padding(.leading, 20)
                
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                viewStore.send(.tapped)
            }
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(PumpingColors.colorGrey300.swiftUIColor, lineWidth: 1)
            )
        }
    }
}
