//
//  OnboardingSignUpView.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/05.
//

import SwiftUI
import AuthenticationServices
import ComposableArchitecture
import SharedDesignSystem

public struct OnboardingAuthView : View {
    public let store: StoreOf<OnboardingAuthStore>
    
    public var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                onboardingInfoView(viewStore: viewStore)
                
                Spacer()
                
                PumpingSubmitButton(title : "Move To Next", isEnable : true) {
                    viewStore.send(.moveToNextStep)
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private func onboardingInfoView(viewStore : ViewStoreOf<OnboardingAuthStore>) -> some View {
        VStack(spacing : 82) {
            TabView(selection: viewStore.binding(\.$tabViewIndex)) {
                Color.red
                    .tag(0)
                Color.yellow
                    .tag(1)
                Color.blue
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .frame(height: 440)
            
            VStack(spacing : 12) {
                switch viewStore.tabViewIndex {
                case 0:
                    Text("워치와 연동하면")
                        .font(.pretendard(size: 15, type: .medium))
                        .foregroundColor(.colorGrey600)
                    
                    Text("나의 운동 상황을 확인할 수 있어요")
                        .font(.pretendard(size: 24, type: .bold))
                        .foregroundColor(.colorGrey900)
                case 1:
                    Text("친구와 경쟁 후")
                        .font(.pretendard(size: 15, type: .medium))
                        .foregroundColor(.colorGrey600)
                    
                    Text("랭킹 카드를 공유해보세요")
                        .font(.pretendard(size: 24, type: .bold))
                        .foregroundColor(.colorGrey900)
                case 2:
                    Text("운동하기 귀찮나요?")
                        .font(.pretendard(size: 15, type: .medium))
                        .foregroundColor(.colorGrey600)
                    
                    Text("친구와 함께 성장해보세요")
                        .font(.pretendard(size: 24, type: .bold))
                        .foregroundColor(.colorGrey900)
                default:
                    EmptyView()
                }
            }
        }
    }
    
    private func signInWithApple(viewStore : ViewStoreOf<OnboardingAuthStore>) -> some View {
        SignInWithAppleButton(
            onRequest: { request in
                request.requestedScopes = [.fullName, .email]
            },
            onCompletion: { result in
                switch result {
                case .success(let authResults):
                    switch authResults.credential {
                    case let appleIDCredential as ASAuthorizationAppleIDCredential:
                        viewStore.send(.moveToNextStep)
                        /*TODO: 로그인 피쳐 사용시 개발
                        let userIdentifier = appleIDCredential.user
                        let fullName = appleIDCredential.fullName
                        let name =  (fullName?.familyName ?? "") + (fullName?.givenName ?? "")
                        let email = appleIDCredential.email
                        let identityToken = String(data: appleIDCredential.identityToken!, encoding: .utf8)
                        let authorizationCode = String(data: appleIDCredential.authorizationCode!, encoding: .utf8)
                         */
                    default:
                        break
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    print("error")
                }
            }
        )

    }
    
}


