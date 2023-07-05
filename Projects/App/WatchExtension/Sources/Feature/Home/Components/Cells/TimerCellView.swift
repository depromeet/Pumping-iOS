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
    
    private func resultListView(viewStore: ViewStoreOf<TimerCellStore>) -> some View {
        VStack {
            resultView(type: .time, value: Double(viewStore.state.timer.time))
            resultView(type: .heatRate, value: viewStore.state.timer.heartRateSum / Double(viewStore.state.timer.heartRateCount))
            resultView(type: .calorie, value: viewStore.state.timer.calorie)
        }
    }
    
    private func resultView(type: TimerCellStore.ResultType, value: Double) -> some View {
        VStack(spacing: 16) {
            HStack(spacing: 8) {
                type.image
                    .resizable()
                    .frame(width: 24, height: 24)
                
                Text(type.title)
                    .font(.pretendard(size: 16, type: .bold))
                    .foregroundColor(PumpingColors.colorGrey800.swiftUIColor)
            }
            
            Text(type.toSyntax(value: value))
                .font(.tenada(size: 56))
                .baselineOffset(-10)
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
