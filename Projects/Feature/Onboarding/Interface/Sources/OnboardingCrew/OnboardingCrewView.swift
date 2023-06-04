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

struct OnboardingCrewView: View {
    public let store: StoreOf<OnboardingCrewStore>
    
    public var body: some View {
        WithViewStore(self.store) { viewStore in
            ZStack {
                Color.colorGreen700
                    .frame(height: 353)
                
                VStack(alignment : .leading) {
                    crewTitleView()
                    
                    Spacer()
                    
                    buttonView(viewStore: viewStore)
                }
            }
            .navigationDestination(isPresented: viewStore.binding(\.$showCrewJoin)) {
                IfLetStore(store.scope(state: \.crewJoin , action: { .crewJoin($0) })) {
                    OnboardingCrewJoinView(store: $0)
                }
            }
            .navigationBarBackButtonHidden(true)
            .padding(.horizontal)
        }
    }
    
    private func crewTitleView() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("아직 크루가 없어요!")
                .font(.pretendard(size: 24, type: .bold))
                .foregroundColor(.colorGrey900)
            
            Text("새로운 운동 크루를 만들어보세요")
                .font(.pretendard(size: 15, type: .medium))
                .foregroundColor(.colorGrey600)
        }
    }
    
    private func buttonView(viewStore : ViewStoreOf<OnboardingCrewStore>) -> some View {
        VStack(spacing: 24) {
            Button {
                viewStore.send(.crewJoinButtonTapped)
            } label: {
                Text("코드로 참여하기")
                    .font(.pretendard(size: 18, type: .bold))
                    .foregroundColor(.colorCyanPrimary)
            }
            
            PumpingSubmitButton(title: "완료") {
                viewStore.send(.moveToNextStep)
            }
        }
        
    }
}
