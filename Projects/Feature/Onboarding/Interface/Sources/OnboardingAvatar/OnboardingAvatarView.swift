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
                
                if let character = viewStore.state.pickedCharacter {
                    Text(character.rawValue)
                } else {
                    // lottie
                    Color.colorGreen700
                        .frame(height: 353)
                }
                
                VStack(alignment : .leading) {
                    avatarTitleView(viewStore: viewStore)
                    
                    Spacer()
                    
                    buttonView(viewStore: viewStore)
                }
            }
            .navigationBarBackButtonHidden(true)
            .padding(.vertical)
        }
    }
    
    private func avatarTitleView(viewStore : ViewStoreOf<OnboardingAvatarStore>) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(viewStore.isAvatarPicked ? "내 캐릭터가 생성되었어요!" : "내 캐릭터를 뽑아보세요")
                .font(.pretendard(size: 24, type: .bold))
                .foregroundColor(.colorGrey900)
            
            Text(viewStore.isAvatarPicked ? "이제 운동 크루를 시작해볼까요?" : "랜덤으로 캐릭터가 만들어져요.")
                .font(.pretendard(size: 15, type: .medium))
                .foregroundColor(.colorGrey600)
        }
        .padding(EdgeInsets(top: 44, leading: 20, bottom: 64, trailing: 20))
    }
    
    @ViewBuilder
    private func buttonView(viewStore : ViewStoreOf<OnboardingAvatarStore>) -> some View {
        PumpingSubmitButton(title: viewStore.isAvatarPicked ? "완료" : "캐릭터 뽑기") {
            if viewStore.isAvatarPicked {
                viewStore.send(.signUp)
            } else {
                viewStore.send(.getRandomCharacter)
            }
        }
        .padding([.horizontal, .bottom])
    }
}
