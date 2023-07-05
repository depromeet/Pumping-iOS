//
//  TimerCellView.swift
//  Pumping
//
//  Created by 송영모 on 2023/07/05.
//

import SwiftUI

import ComposableArchitecture
import WatchSharedDesignSystem

public struct TimerCellView: View {
    public let store: StoreOf<TimerCellStore>
    
    public init(store: StoreOf<TimerCellStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                Text("\(viewStore.timer.workoutCategoryIdentifier.rawValue)")
                
                Spacer()
                
                Text("\(viewStore.timer.time)")
                Text("\(viewStore.timer.calorie)")
                Text("\(viewStore.timer.heartRateSum)")
                
                Spacer()
            }
        }
    }
    
    private func summaryView(title: String) -> some View {
        HStack {
            PumpingImages.iconHeartbeat.swiftUIImage
            
            Text(title)
        }
    }
}
