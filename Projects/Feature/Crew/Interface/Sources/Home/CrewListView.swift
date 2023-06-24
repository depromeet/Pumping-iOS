//
//  CrewListView.swift
//  FeatureCrewInterface
//
//  Created by 박현우 on 2023/06/23.
//

import SwiftUI

import SwiftUI
import ComposableArchitecture
import SharedDesignSystem

public struct CrewListView: View {
    public let store: StoreOf<CrewHomeStore>
    
    public init(
        store: StoreOf<CrewHomeStore>
    ) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack(alignment: .leading) {
                Text("크루")
                    .font(.pretendard(size: 21, type: .semiBold))
                    .foregroundColor(.colorGrey900)
                
                Spacer()
                
                buttonView(viewStore: viewStore)
            }
            .fullScreenCover(isPresented: viewStore.binding(\.$showCrewJoinView)) {
                CrewJoinView(store: store)
            }
            .fullScreenCover(isPresented: viewStore.binding(\.$showCrewMakeView)) {
                CrewMakeView(store: store)
            }
            .padding(23)
        }
    }
    
    
    
    private func buttonView(viewStore : ViewStoreOf<CrewHomeStore>) -> some View {
        HStack {
            Button {
                viewStore.send(.presentCrewJoinView)
            } label: {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.colorGrey200)
                    .frame(height: 56)
                    .overlay {
                        Text("코드로 참여하기")
                            .font(.pretendard(size: 18, type: .semiBold))
                            .foregroundColor(.colorCyanPrimary)
                    }
            }
            
            PumpingSubmitButton(title: "크루 만들기") {
                viewStore.send(.presentCrewMakeView)
            }
        }
    }
}


