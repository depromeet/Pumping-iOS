//
//  OnboardingCrewJoinView.swift
//  FeatureOnboardingInterface
//
//  Created by 박현우 on 2023/06/04.
//

import SwiftUI
import ComposableArchitecture
import SharedDesignSystem

struct OnboardingCrewJoinView: View {
    public let store: StoreOf<OnboardingCrewJoinStore>
    
    public var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack(alignment: .leading, spacing : 40) {
                crewJoinTitleView()
                
                PumpingTextField(text: viewStore.binding(\.$code))
                    .setPlaceHolderText("최대 15자 이내로 작성해주세요.")
                
                Spacer()
                
                PumpingSubmitButton(title: "완료") {
                    
                }
            }
//            .onDisappear {
//                viewStore.send(.crewJoinViewDidDisappear)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Image(systemName: "chevron.left")
//                        .foregroundColor(.colorGrey000)
//                }
//            }
//            .navigationBarBackButtonHidden(true)
            .padding(.horizontal)
        }
    }
    
    private func crewJoinTitleView() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("코드 참여")
                .font(.pretendard(size: 24, type: .bold))
                .foregroundColor(.colorGrey900)
            
            VStack(alignment: .leading) {
                Text("번호 코드를 입력하고 방에")
                Text("참여해보세요!")
            }
            .font(.pretendard(size: 15, type: .medium))
            .foregroundColor(.colorGrey600)
        }
    }
}
