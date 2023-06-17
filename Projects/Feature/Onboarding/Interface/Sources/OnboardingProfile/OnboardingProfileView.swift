//
//  OnboardingProfileView.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/11.
//

import SwiftUI
import ComposableArchitecture
import SharedDesignSystem

public struct OnboardingProfileView : View {
    public let store: StoreOf<OnboadingProfileStore>
    
    public var body: some View {
        WithViewStore(self.store) { viewStore in
            GeometryReader { _ in
                ZStack {
                    VStack(alignment : .leading, spacing : 32){
                        
                        profileTitleView()
                        
                        PumpingTextField(text: viewStore.binding(\.$name))
                            .setTitleText("이름")
                            .setMaxCount(viewStore.maxCount)
                            .setPlaceHolderText("최대 15자 이내로 작성해주세요.")
                            .setErrorText("15자까지만 쓸 수 있어요.")
                        
                        
                        genderSelectionView(viewStore: viewStore)
                        
                        PumpingWheelPicker(value: viewStore.binding(\.$height), pickerUnit: .height)
                            .setTitleText("키")
                        
                        PumpingWheelPicker(value: viewStore.binding(\.$weight), pickerUnit: .weight)
                            .setTitleText("몸무게")
                        
                        Spacer()
                        
                        PumpingSubmitButton(title : "다음", isEnable : viewStore.isSatisfied) {
                            viewStore.send(.moveToNextStep)
                        }
                        
                    }
                }
            }
            .transaction { transaction in
                transaction.animation = nil
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .padding()
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private func profileTitleView() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("프로필 작성")
                .font(.pretendard(size: 24, type: .bold))
                .foregroundColor(.colorGrey900)
            
            Text("정확한 건강정보 수집을 위해 필요해요.")
                .font(.pretendard(size: 15, type: .medium))
                .foregroundColor(.colorGrey600)
        }
    }
    
    @ViewBuilder
    private func genderSelectionView(viewStore : ViewStoreOf<OnboadingProfileStore>) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("성별")
                .font(.pretendard(size: 16, type: .bold))
                .foregroundColor(.colorGrey800)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                Button {
                    viewStore.send(.setGender(.male))
                } label: {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(viewStore.state.gender == .male ? Color.colorCyanPrimary : Color.colorGrey500, lineWidth : 1)
                        .frame(height: 50)
                        .overlay {
                            Text("남성")
                                .font(.pretendard(size: 15, type: .medium))
                                .foregroundColor(viewStore.state.gender == .male ? .colorGrey000 : .colorGrey500)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(viewStore.state.gender == .male ? Color.colorCyan50 : Color.clear)
                        )
                }
                
                Button {
                    viewStore.send(.setGender(.female))
                } label: {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(viewStore.state.gender == .female ? Color.colorCyanPrimary : Color.colorGrey500 , lineWidth : 1)
                        .frame(height: 50)
                        .overlay {
                            Text("여성")
                                .font(.pretendard(size: 15, type: .medium))
                                .foregroundColor(viewStore.state.gender == .female ? .colorGrey000 : .colorGrey500)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(viewStore.state.gender == .female ? Color.colorCyan50 : Color.clear)
                        )
                }
            }
        }
    }
}
