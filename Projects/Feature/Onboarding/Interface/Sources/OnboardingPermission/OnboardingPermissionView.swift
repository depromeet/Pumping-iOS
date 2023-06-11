//
//  OnboardingPermissionView.swift
//  FeatureOnboardingInterface
//
//  Created by 박현우 on 2023/06/02.
//

import SwiftUI
import ComposableArchitecture
import SharedDesignSystem
import CoreHealthKitManager

struct OnboardingPermissionView: View {
    public let store: StoreOf<OnboardingPermissionStore>
    
    public var body: some View {
        WithViewStore(self.store) { viewStore in
            ZStack {
                Color.colorGreen700
                    .frame(height: 353)
                
                VStack(alignment : .leading) {
                    permissionTitleView()
                    
                    Spacer()
                    
                    PumpingSubmitButton(title: "권한 부여", isEnable: true) {
                        HealthKitAuthorizationHelper.shared.checkAuthorizationAndRequest {
                            viewStore.send(.moveToNextStep)
                        } onFailure: {
                            viewStore.send(.failToAuthorize)
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .padding()
        }
    }
    
    private func permissionTitleView() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("건강 앱 접근 허용")
                .font(.pretendard(size: 24, type: .bold))
                .foregroundColor(.colorGrey900)
            
            VStack(alignment: .leading) {
                Text("건강 데이터가 없으면")
                Text("펌핑앱을 이용하기 어려워요.")
            }
            .font(.pretendard(size: 15, type: .medium))
            .foregroundColor(.colorGrey600)
        }
    }
}
