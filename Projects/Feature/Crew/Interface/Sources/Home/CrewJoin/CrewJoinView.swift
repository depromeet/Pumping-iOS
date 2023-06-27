//
//  CrewJoinView.swift
//  FeatureCrewInterface
//
//  Created by 박현우 on 2023/06/24.
//

import SwiftUI
import ComposableArchitecture
import Shared

struct CrewJoinView: View {
    public let store: StoreOf<CrewJoinStore>
    
    public init(
        store: StoreOf<CrewJoinStore>
    ) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store) { viewStore in
            NavigationStack {
                VStack(alignment : .leading, spacing : 50){
                    
                    crewJoinTitleView()
                    
                    PumpingTextField(text: viewStore.binding(\.$code))
                        .setPlaceHolderText("000000")
                    
                    Spacer()
                    
                    PumpingSubmitButton(title : "완료", isEnable: viewStore.isSatisfied ) {
                        viewStore.send(.goToCrewJoinDetailView)
                    }
                    
                }
                .navigationDestination(isPresented: viewStore.binding(\.$showCrewJoinDetailView)) {
                    CrewJoinDetailView(store: store)
                }
                .padding()
                .pumpingNavigationBar(trailingButtonAction: {
                    viewStore.send(.dismissCrewJoinView)
                })
            }
            
        }
    }
    
    private func crewJoinTitleView() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("코드 참여")
                .font(.pretendard(size: 24, type: .bold))
                .foregroundColor(.colorGrey900)
            
            VStack(alignment: .leading) {
                Text("번호 코드를 입력하고 방에")
                Text("참여해보세요.")
            }
            .font(.pretendard(size: 15, type: .medium))
            .foregroundColor(.colorGrey600)
        }
    }
    
}
