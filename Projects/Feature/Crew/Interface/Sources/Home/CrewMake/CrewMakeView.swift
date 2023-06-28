//
//  CrewMakeView.swift
//  FeatureCrewInterface
//
//  Created by 박현우 on 2023/06/24.
//

import SwiftUI
import ComposableArchitecture
import Shared

struct CrewMakeView: View {
    public let store: StoreOf<CrewMakeStore>
    
    public init(
        store: StoreOf<CrewMakeStore>
    ) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store) { viewStore in
            NavigationStack {
                GeometryReader { _ in
                    ZStack {
                        VStack(alignment : .leading, spacing : 50){
                            
                            crewMakeTitleView()
                            
                            VStack(spacing : 30) {
                                PumpingTextField(text: viewStore.binding(\.$crewName))
                                    .setTitleText("크루 이름")
                                    .setErrorText("15자까지만 쓸 수 있어요.")
                                    .setPlaceHolderText("최대 15자 이내로 작성해주세요.")
                                
                                goalCountCounter(viewStore: viewStore)
                            }
                            
                            Spacer()
                            
                            PumpingSubmitButton(title : "완료", isEnable: viewStore.isSatisfied) {
                                viewStore.send(.goToCrewMakeCompleteView)
                            }
                            
                        }
                    }
                }
                .pumpingNavigationBar(trailingButtonAction: {
                    viewStore.send(.dismissCrewMakeView)
                })
                .navigationDestination(isPresented: viewStore.binding(\.$showCrewMakeCompleteView)) {
                    CrewMakeCompleteView(store: store)
                }
                .ignoresSafeArea(.keyboard, edges: .bottom)
                .padding()
               
            }
        }
    }
    
    private func crewMakeTitleView() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("크루 만들기")
                .font(.pretendard(size: 24, type: .bold))
                .foregroundColor(.colorGrey900)
            
            Text("7일의 경쟁 기간동안 운동 목표도 세워보세요!")
                .font(.pretendard(size: 15, type: .medium))
                .foregroundColor(.colorGrey600)
        }
    }
    
    private func goalCountCounter(viewStore: ViewStoreOf<CrewMakeStore>) -> some View {
        VStack(spacing: 10) {
            HStack {
                Text("운동 횟수 목표")
                    .font(.pretendard(size: 16, type: .bold))
                    .foregroundColor(.colorGrey800)
                
                Spacer()
            }
            
            HStack {
                Button {
                    viewStore.send(.subGoalCount)
                } label: {
                    Circle()
                        .fill(Color.colorGrey100)
                        .frame(width: 28, height: 28)
                        .overlay {
                            Image(systemName: "minus")
                                .tint(.colorCyanPrimary)
                        }
                }
                
                Spacer()
                
                Text("주 \(viewStore.goalCount)회")
                    .font(.pretendard(size: 18, type: .semiBold))
                
                Spacer()
                
                Button {
                    viewStore.send(.addGoalCount)
                } label: {
                    Circle()
                        .fill(Color.colorGrey100)
                        .frame(width: 28, height: 28)
                        .overlay {
                            Image(systemName: "plus")
                                .tint(.colorCyanPrimary)
                        }
                }
            }
            .frame(width: 200)
        }
        .frame(maxWidth: .infinity)
    }

    
}
