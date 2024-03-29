//
//  WorkoutStartView.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/23.
//

import SwiftUI

import ComposableArchitecture

import SharedDesignSystem

public struct WorkoutStartView: View {
    public let store: StoreOf<WorkoutStartStore>
    
    public init(store: StoreOf<WorkoutStartStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(spacing: .zero) {
                Text("운동을 시작해볼까요?")
                    .font(.pretendard(size: 24, type: .bold))
                    .padding(.top, 50)
                
                Spacer()
                
                PumpingImages.imgStartWorkout.swiftUIImage
                
                Spacer()
                
                PumpingSubmitButton(title: "시작하기", completion: {
                    viewStore.send(.startButtonTapped)
                })
                .padding(.horizontal)
            }
            .background(PumpingColors.colorGrey000.swiftUIColor)
            .navigationBarBackButtonHidden(true)
        }
    }
}
