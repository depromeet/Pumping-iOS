//
//  PumpingTextCell.swift
//  SharedDesignSystem
//
//  Created by 송영모 on 2023/05/26.
//

import SwiftUI

import ComposableArchitecture

public struct PumpingTextCellView: View {
    public let store: StoreOf<PumpingTextCellStore>
    
    public init(store: StoreOf<PumpingTextCellStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            HStack {
                Text(viewStore.state.title)
                    .font(.pretendard(size: 15, type: .medium))
                
                Spacer()
                
                //TODO: isTapped가 True이면 이미지 추가
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(viewStore.isTapped ? Color.colorCyan300 : Color.colorGrey300, lineWidth: 1)
            )
        }
    }
}
