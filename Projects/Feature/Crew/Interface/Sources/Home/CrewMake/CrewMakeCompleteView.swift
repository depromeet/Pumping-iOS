//
//  CrewMakeCompleteView.swift
//  FeatureCrewInterface
//
//  Created by 박현우 on 2023/06/27.
//

import SwiftUI
import ComposableArchitecture
import Shared

struct CrewMakeCompleteView: View {
    public let store: StoreOf<CrewHomeStore>
    @Environment(\.dismiss) var dismiss
    
    public init(
        store: StoreOf<CrewHomeStore>
    ) {
        self.store = store
    }
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack(spacing: 50) {
                crewMakeCompleteTitleView()
                
                Color.colorGreen700
                    .frame(height: 353)
                
                Spacer()
                
                crewMakeCompleteButtonView(viewStore: viewStore)
                
            }
            .navigationBarBackButtonHidden(true)
            .padding()
        }
    }
    
    private func crewMakeCompleteTitleView() -> some View {
        VStack(alignment: .center, spacing: 12) {
            Text("운동 크루 완성!")
                .font(.pretendard(size: 24, type: .bold))
                .foregroundColor(.colorGrey900)
            
            VStack {
                Text("코드를 복사해 방을 초대할 수 있어요.")
                Text("이제 운동을 시작해보세요.")
            }
            .font(.pretendard(size: 15, type: .medium))
            .foregroundColor(.colorGrey600)
        }
        .padding(.top, 44)
    }
    
    private func crewMakeCompleteButtonView(viewStore: ViewStoreOf<CrewHomeStore>) -> some View {
        VStack {
            Button {
                viewStore.send(.copyCode)
            } label: {
                Text("코드 복사하기")
                    .font(.pretendard(size: 18, type: .semiBold))
                    .foregroundColor(.colorCyanPrimary)
            }
            
            PumpingSubmitButton(title: "완료") {
                viewStore.send(.dismissCrewMakeView)
            }
        }
    }
}
