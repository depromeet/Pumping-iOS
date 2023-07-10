//
//  MyPageRootStoreInterface.swift
//  FeatureProfileInterface
//
//  Created by Derrickk kim on 2023/05/09.
//

import ComposableArchitecture
import SharedDesignSystem

public enum ProfileScene: Hashable {
    case root
    case widthOfChange
}

public struct ProfileRootStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>

    private let profileStore: ProfileStore
    private let widthOfChangeStore: WidthOfChangeStore

    public init(
        reducer: Reduce<State, Action>,
        profileStore: ProfileStore,
        widthOfChangeStore: WidthOfChangeStore
    ) {
        self.reducer = reducer
        self.profileStore = profileStore
        self.widthOfChangeStore = widthOfChangeStore
    }

    public struct State: Equatable {
        @BindingState public var path: [ProfileScene] = []

        public var profile: ProfileStore.State = .init()
        public var widthOfChange: WidthOfChangeStore.State?

        public init() {

        }
    }

    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)

        case widthOfChange(WidthOfChangeStore.Action)
        case profile(ProfileStore.Action)
    }

    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()

        reducer
            .ifLet(\.widthOfChange, action: /Action.widthOfChange) {
                widthOfChangeStore
            }
        
        Scope(state: \.profile, action: /Action.profile) {
            profileStore
        }
    }
}
