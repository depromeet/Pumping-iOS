//
//  CrewJoinView.swift
//  FeatureCrewInterface
//
//  Created by 박현우 on 2023/06/24.
//

import SwiftUI
import ComposableArchitecture
import SharedDesignSystem

struct CrewJoinView: View {
    @Environment(\.dismiss) var dismiss
    public let store: StoreOf<CrewHomeStore>
    
    public init(
        store: StoreOf<CrewHomeStore>
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
                    
                    PumpingSubmitButton(title : "완료", isEnable: isButtonEnable(code: viewStore.code) ) {
                        viewStore.send(.goToCrewJoinDetailView)
                    }
                    
                }
                .navigationDestination(isPresented: viewStore.binding(\.$showCrewJoinDetailView)) {
                    CrewJoinDetailView(store: store)
                }
                .ignoresSafeArea(.keyboard, edges: .bottom)
                .padding()
                .pumpingNavigationBar(trailingButtonAction: {
                    viewStore.send(.dismissCrewJoinView)
                    dismiss()
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
    
    private func isButtonEnable(code: String) -> Bool {
        return code.count > 0 && code.count < 16
    }
}
