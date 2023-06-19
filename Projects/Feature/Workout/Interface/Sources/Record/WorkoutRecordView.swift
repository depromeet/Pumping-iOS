//
//  WorkoutRecordView.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/06/18.
//

import SwiftUI

import ComposableArchitecture

import SharedDesignSystem

public struct WorkoutRecordView: View {
    public let store: StoreOf<WorkoutRecordStore>
    
    public init(store: StoreOf<WorkoutRecordStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                titleView()
                    .padding(.horizontal)
                
                Spacer()
                
                PumpingSubmitButton(title: "완료", completion: {
                    viewStore.send(.completeButtonTapped)
                })
            }
            .navigationBarBackButtonHidden(true)
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
    
    @ViewBuilder
    private func titleView() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("오늘 수행한 세트를 알려주세요.")
                .font(.pretendard(size: 24, type: .bold))
                .foregroundColor(PumpingColors.colorGrey900.swiftUIColor)
            
            Text("운동 기구와 중량도 작성할 수 있어요.")
                .font(.pretendard(size: 15, type: .medium))
                .foregroundColor(.colorGrey600)
            
            HStack {
                Spacer()
            }
        }
    }
}
