//
//  OnboardingCrewView.swift
//  FeatureOnboardingInterface
//
//  Created by 박현우 on 2023/06/02.
//

import Foundation
import SwiftUI
import ComposableArchitecture
import SharedDesignSystem

struct OnboardingAvatarView: View {
    public let store: StoreOf<OnboardingAvatarStore>
    
    public var body: some View {
        WithViewStore(self.store) { viewStore in
            ZStack {
                Color.colorGreen700
                    .frame(height: 353)
                
                VStack(alignment : .leading) {
                    avatarTitleView()
                    
                    Spacer()
                    
                    buttonView(viewStore: viewStore)
                }
            }
            .navigationBarBackButtonHidden(true)
            .padding(.vertical)
        }
    }
    
    private func avatarTitleView() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("내 캐릭터를 뽑아보세요")
                .font(.pretendard(size: 24, type: .bold))
                .foregroundColor(.colorGrey900)
            
            Text("랜덤으로 캐릭터가 만들어져요.")
                .font(.pretendard(size: 15, type: .medium))
                .foregroundColor(.colorGrey600)
        }
        .padding([.horizontal])
    }
    
    @ViewBuilder
    private func buttonView(viewStore : ViewStoreOf<OnboardingAvatarStore>) -> some View {
        PumpingSubmitButton(title: viewStore.isAvatarPicked ? "다음" : "캐릭터 뽑기") {
            if viewStore.isAvatarPicked {
                viewStore.send(.moveToNextStep)
            } else {
                //TODO: 아바타 뽑기 시 로직 작성
                viewStore.send(.moveToNextStep)
            }
        }
        .padding([.horizontal, .bottom])
    }
}
