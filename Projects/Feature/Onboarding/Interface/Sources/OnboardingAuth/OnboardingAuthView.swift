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
import Core
import HealthKit

public struct OnboardingAuthView : View {
    public let store: StoreOf<OnboardingAuthStore>
    
    public var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                onboardingInfoView(viewStore: viewStore)
                
                Spacer()

                signInWithAppleButton(viewStore: viewStore)
            }
            .ignoresSafeArea(edges: [.top])
            .background(PumpingColors.colorGrey000.swiftUIColor)
            .onAppear {
                viewStore.send(.checkAuthorization)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private func onboardingInfoView(viewStore : ViewStoreOf<OnboardingAuthStore>) -> some View {
        VStack(spacing : 82) {
            TabView(selection: viewStore.binding(\.$tabViewIndex)) {
                firstTabView()
                    .tag(0)
                secondTabView()
                    .tag(1)
                thirdTabView()
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
    
    private func firstTabView() -> some View {
        VStack {
            PumpingImages.imgOnboardingFirst.swiftUIImage
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(PumpingColors.colorBlue500.swiftUIColor)
    }
    
    private func secondTabView() -> some View {
        VStack {
            PumpingImages.imgOnboardingSecond.swiftUIImage
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(PumpingColors.colorBlue500.swiftUIColor)
    }
    
    private func thirdTabView() -> some View {
        VStack {
            PumpingImages.imgOnboardingThird.swiftUIImage
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(PumpingColors.colorBlue500.swiftUIColor)
    }
    
    private func signInWithAppleButton(viewStore : ViewStoreOf<OnboardingAuthStore>) -> some View {
        VStack {
            SignInWithAppleButton(
                onRequest: { request in
                    request.requestedScopes = [.fullName, .email]
                },
                onCompletion: { result in
                    switch result {
                    case let .success(authResults):
                        switch authResults.credential {
                        case let appleIDCredential as ASAuthorizationAppleIDCredential:
                            viewStore.send(.signInWithApple(appleIDCredential))
                            
                        default:
                            break
                        }
                    case let .failure(error):
                        viewStore.send(.signInWithAppleError(error.localizedDescription))
                    }
                }
            )
            .frame(height: 50)
            .signInWithAppleButtonStyle(.whiteOutline)
        }
        .padding([.horizontal, .bottom])
    }
    
}


