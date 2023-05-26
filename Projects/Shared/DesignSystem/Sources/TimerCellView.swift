//
//  TimerCellView.swift
//  SharedDesignSystem
//
//  Created by 송영모 on 2023/05/26.
//

import SwiftUI

import ComposableArchitecture

public struct TimerCellView: View {
    public let store: StoreOf<TimerCellStore>

    public init(store: StoreOf<TimerCellStore>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                HStack {
                    Text("00:00")
                        .font(.pretendard(size: 21, type: .bold))
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "play.circle.fill")
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
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.colorGrey300, lineWidth: 1)
            )
        }
    }
}
