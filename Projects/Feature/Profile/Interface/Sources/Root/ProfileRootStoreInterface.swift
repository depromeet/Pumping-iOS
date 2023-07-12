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

    private let profileHomeStore: ProfileHomeStore
    private let profileWidthOfChangeStore: ProfileWidthOfChangeStore

    public init(
        reducer: Reduce<State, Action>,
        profileHomeStore: ProfileHomeStore,
        profileWidthOfChangeStore: ProfileWidthOfChangeStore
    ) {
        self.reducer = reducer
        self.profileHomeStore = profileHomeStore
        self.profileWidthOfChangeStore = profileWidthOfChangeStore
    }

    public struct State: Equatable {
        @BindingState public var path: [ProfileScene] = []

        public var home: ProfileHomeStore.State = .init(userId: "", type: .my)
        public var widthOfChange: ProfileWidthOfChangeStore.State?

        public init() {

        }
    }

    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)

        case home(ProfileHomeStore.Action)
        case widthOfChange(ProfileWidthOfChangeStore.Action)
    }

    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()

        reducer
            .ifLet(\.widthOfChange, action: /Action.widthOfChange) {
                profileWidthOfChangeStore
            }
        
        Scope(state: \.home, action: /Action.home) {
            profileHomeStore
        }
    }
}
