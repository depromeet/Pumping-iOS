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
            VStack(spacing : 32){
                
                PumpingTextField(text: viewStore.binding(\.$name))
                    .setTitleText("이름")
                    .setPlaceHolderText("최대 15자 이내로 작성해주세요.")
                
                
                genderSelectionView(viewStore: viewStore)
                
                PumpingWheelPicker(value: viewStore.binding(\.$height), pickerUnit: .height)
                    .setTitleText("키")
                
                PumpingWheelPicker(value: viewStore.binding(\.$weight), pickerUnit: .weight)
                    .setTitleText("몸무게")
                
                Spacer()
                
                PumpingSubmitButton(title : "계속하기", isEnable : viewStore.isSatisfied) {
                    viewStore.send(.moveToNextStep)
                }
                
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .padding(.horizontal)
            .navigationBarBackButtonHidden(true)
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
                    viewStore.send(.setGender(.M))
                } label: {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(viewStore.state.gender == .M ? Color.colorCyanPrimary : Color.colorGrey500, lineWidth : 1)
                        .frame(height: 50)
                        .overlay {
                            Text("남성")
                                .font(.pretendard(size: 15, type: .medium))
                                .foregroundColor(viewStore.state.gender == .M ? .colorGrey000 : .colorGrey500)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(viewStore.state.gender == .M ? Color.colorCyan50 : Color.clear)
                        )
                }
                
                Button {
                    viewStore.send(.setGender(.W))
                } label: {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(viewStore.state.gender == .W ? Color.colorCyanPrimary : Color.colorGrey500 , lineWidth : 1)
                        .frame(height: 50)
                        .overlay {
                            Text("여성")
                                .font(.pretendard(size: 15, type: .medium))
                                .foregroundColor(viewStore.state.gender == .W ? .colorGrey000 : .colorGrey500)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(viewStore.state.gender == .W ? Color.colorCyan50 : Color.clear)
                        )
                }
            }
        }
    }
    
}
