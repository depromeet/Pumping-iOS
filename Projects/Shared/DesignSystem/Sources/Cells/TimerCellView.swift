//
//  TimerCellView.swift
//  SharedDesignSystem
//
//  Created by 송영모 on 2023/05/26.
//

import SwiftUI

import ComposableArchitecture

import SharedUtil

public struct TimerCellView: View {
    public let store: StoreOf<TimerCellStore>
    
    public init(store: StoreOf<TimerCellStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                HStack {
                    Text(DateManager.toClockString(from: viewStore.second))
                        .font(.pretendard(size: 21, type: .bold))
                    
                    Button(action: {
                        viewStore.send(.tapped)
                    }, label: {
                        (viewStore.isActive ? PumpingImages.stop : PumpingImages.play)
                            .swiftUIImage
                            .resizable()
                            .frame(width: 32, height: 32)
                    })
                }
                .padding(.bottom, 24)
                
                HStack {
                    Text(viewStore.state.title)
                        .font(.pretendard(size: 15, type: .medium))
                        .foregroundColor(.colorGrey900)
                    
                    Spacer()
                }
            }
            .padding()
            .background(viewStore.isActive ? PumpingColors.colorCyan100.swiftUIColor : .clear)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(viewStore.isActive ? PumpingColors.colorCyan200.swiftUIColor : PumpingColors.colorGrey300.swiftUIColor, lineWidth: 2)
            )
        }
    }
}
