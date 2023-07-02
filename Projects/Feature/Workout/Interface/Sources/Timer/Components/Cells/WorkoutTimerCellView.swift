//
//  WorkoutTimerCellView.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/06/24.
//

import SwiftUI
import ComposableArchitecture
import Shared

public struct WorkoutTimerCellView: View {
    public let store: StoreOf<WorkoutTimerCellStore>
    
    public init(store: StoreOf<WorkoutTimerCellStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                HStack {
                    Text(DateManager.toClockString(from: viewStore.state.timer.time))
                        .font(.pretendard(size: 21, type: .bold))
                        .frame(width: 100)
                    
                    Button(action: {
                        viewStore.send(.tapped)
                    }, label: {
                        (viewStore.state.timer.isActive ? PumpingImages.stop : PumpingImages.play)
                            .swiftUIImage
                            .resizable()
                            .frame(width: 32, height: 32)
                    })
                    
                    Spacer()
                }
                .padding(.bottom, 24)
                
                HStack {
                    Text(viewStore.state.timer.workoutCategoryIdentifier.rawValue)
                        .font(.pretendard(size: 15, type: .medium))
                        .foregroundColor(.colorGrey900)
                                            
                    Spacer()
                }
            }
            .padding()
            .background(viewStore.state.timer.isActive ? PumpingColors.colorCyan100.swiftUIColor : .clear)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(viewStore.state.timer.isActive ? PumpingColors.colorCyan200.swiftUIColor : PumpingColors.colorGrey300.swiftUIColor, lineWidth: 2)
            )
        }
    }
}
