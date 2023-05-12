//
//  OnboardingRootView.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/05.
//

import ComposableArchitecture

public enum OnboardingScene: Hashable {
    case root
    case nickname
    case signUp
    case otherProfile //TODO: 피쳐 분리후 이동
    case otherProfileDetail //TODO: 피쳐 분리후 이동
}

public struct OnboardingRootStore: ReducerProtocol {
    private let reduce: Reduce<State, Action>
    private let onboardingNicknameStore: OnboardingNicknameStore
    private let onboardingSignUpStore: OnboardingSignUpStore
    private let otherProfileStore: OtherProfileStore
    private let otherProfileDetailStore: OtherProfileDetailStore
    
    public init(
        reduce: Reduce<State, Action>,
        onboardingNicknameStore: OnboardingNicknameStore,
        onboardingSignUpStore: OnboardingSignUpStore,
        otherProfileStore: OtherProfileStore,
        otherProfileDetailStore: OtherProfileDetailStore
    ) {
        self.reduce = reduce
        self.onboardingNicknameStore = onboardingNicknameStore
        self.onboardingSignUpStore = onboardingSignUpStore
        self.otherProfileStore = otherProfileStore
        self.otherProfileDetailStore = otherProfileDetailStore
    }
    
    public struct State: Equatable {
        @BindingState public var path: [OnboardingScene] = []
        
        public var nickname: OnboardingNicknameStore.State?
        public var signUp: OnboardingSignUpStore.State?
        public var otherProfile: OtherProfileStore.State?
        public var otherProfileDetail: OtherProfileDetailStore.State?
        
        public init() {
            
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case tapNicknameButton
        case tapOtherProfileButton
        
        case nickname(OnboardingNicknameStore.Action)
        case signUp(OnboardingSignUpStore.Action)
        case otherProfile(OtherProfileStore.Action)
        case otherProfileDetail(OtherProfileDetailStore.Action)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reduce
            .ifLet(\.nickname, action: /Action.nickname) {
                onboardingNicknameStore
            }
            .ifLet(\.signUp, action: /Action.signUp) {
                onboardingSignUpStore
            }
            .ifLet(\.otherProfile, action: /Action.otherProfile) {
                otherProfileStore
            }
            .ifLet(\.otherProfileDetail, action: /Action.otherProfileDetail) {
                otherProfileDetailStore
            }
    }
}


public struct OnboardingRootView {
    public let store: StoreOf<OnboardingRootStore>
    
    public init(store: StoreOf<OnboardingRootStore>) {
        self.store = store
    }
}
