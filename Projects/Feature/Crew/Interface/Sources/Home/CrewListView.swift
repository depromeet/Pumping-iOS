//
//  CrewListView.swift
//  FeatureCrewInterface
//
//  Created by 박현우 on 2023/06/23.
//

import SwiftUI
import UIKit
import ComposableArchitecture
import SharedDesignSystem

public struct CrewListView: View {
    public let store: StoreOf<CrewHomeStore>
    
    public init(store: StoreOf<CrewHomeStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack(alignment: .leading) {
                Text("크루")
                    .font(.pretendard(size: 21, type: .semiBold))
                    .foregroundColor(.colorGrey900)
                    .padding(.bottom, 50)
                
                crewListView(viewStore: viewStore)
                
                Spacer()
                
                buttonView(viewStore: viewStore)
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
            .fullScreenCover(isPresented: viewStore.binding(\.$showCrewJoinView)) {
                IfLetStore(store.scope(state: \.crewJoin, action: { .crewJoin($0) })) {
                    CrewJoinView(store: $0)
                }
            }
            .fullScreenCover(isPresented: viewStore.binding(\.$showCrewMakeView)) {
                IfLetStore(store.scope(state: \.crewMake, action: { .crewMake($0) })) {
                    CrewMakeView(store: $0)
                }
            }
            .padding(23)
        }
    }
    
    private func crewListView(viewStore : ViewStoreOf<CrewHomeStore>) -> some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(viewStore.crewList, id: \.self.crewId) { crew in
                HStack {
                    Text(crew.crewName)
                        .font(.pretendard(size: 16, type: .semiBold))
                        .foregroundColor(.colorGrey600)
                    
                    Spacer()
                    
                    Button {
                        UIPasteboard.general.string = crew.code
                    } label: {
                        PumpingImages.crewcode.swiftUIImage
                    }
                }
            }
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


