//
//  WorkoutCategoryCellView.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/06/24.
//

import SwiftUI

import ComposableArchitecture

import Shared

public struct WorkoutCategoryCellView: View {
    public let store: StoreOf<WorkoutCategoryCellStore>
    
    public init(store: StoreOf<WorkoutCategoryCellStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            HStack {
                Text(viewStore.state.workoutCategoryIdentifier.title)
                    .font(.pretendard(size: 15, type: .medium))
                    .padding([.top, .bottom], 16)
                    .padding(.leading, 20)
                
                Spacer()
                
                if viewStore.isTapped {
                    PumpingImages.active.swiftUIImage
                        .resizable()
                        .frame(width: 28, height: 28)
                        .padding(.trailing, 17)
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                viewStore.send(.tapped)
            }
            .background(viewStore.isTapped ? PumpingColors.colorCyan100.swiftUIColor : .clear)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(viewStore.isTapped ? PumpingColors.colorCyan200.swiftUIColor : PumpingColors.colorGrey300.swiftUIColor, lineWidth: 1)
            )
        }
    }
}
