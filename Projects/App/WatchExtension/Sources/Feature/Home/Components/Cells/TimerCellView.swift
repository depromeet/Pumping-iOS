//
//  TimerCellView.swift
//  Pumping
//
//  Created by 송영모 on 2023/07/05.
//

import SwiftUI

import ComposableArchitecture

public struct WorkoutTimerCellView: View {
    public let store: StoreOf<TimerCellStore>
    
    public init(store: StoreOf<TimerCellStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                Text("\(viewStore.timer.time)")
                Text("\(viewStore.timer.calorie)")
                Text("\(viewStore.timer.heartRateSum)")
            }
        }
    }
}
