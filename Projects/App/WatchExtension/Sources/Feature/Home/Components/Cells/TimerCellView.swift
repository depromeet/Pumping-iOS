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
            VStack(alignment: .center) {
                Text("\(viewStore.timer.workoutCategoryIdentifier.rawValue)")
                
                Spacer()
                
                resultListView(viewStore: viewStore)
                
                Spacer()
            }
        }
    }
    
    private func resultListView(viewStore: ViewStoreOf<TimerCellStore>) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            resultView(type: .time, value: Double(viewStore.state.timer.time))
            resultView(type: .heatRate, value: viewStore.state.timer.heartRateSum / Double(viewStore.state.timer.heartRateCount))
            resultView(type: .calorie, value: viewStore.state.timer.calorie)
        }
    }
    
    private func resultView(type: TimerCellStore.ResultType, value: Double) -> some View {
            HStack(spacing: 12) {
                type.image
                    .resizable()
                    .frame(width: 25, height: 25)
                
                Text(type.toSyntax(value: value))
                    .font(.tenada(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor({switch type {
                    case .time:
                        return PumpingColors.colorCyan200.swiftUIColor
                    case .heatRate:
                        return PumpingColors.colorTeal300.swiftUIColor
                    case .calorie:
                        return PumpingColors.colorGreen400.swiftUIColor
                    }}())
            }
    }
}
