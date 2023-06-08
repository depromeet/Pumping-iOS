//
//  MyPageRootStoreInterface.swift
//  FeatureProfileInterface
//
//  Created by 김태현 on 2023/05/09.
//

import ComposableArchitecture

public enum MyPageScene: Hashable {
    case root
    case widthOfChange
}

public enum ProfileScene: Hashable {
    case my
    case other
}

public struct ProfileRootStore: ReducerProtocol {

    private let reducer: Reduce<State, Action>

    public init(reducer: Reduce<State, Action>) {
        self.reducer = reducer
    }

    public struct State: Equatable {
        @BindingState public var path: [MyPageScene] = []

        public var profileScene: ProfileScene = .my
        public var hasComparison: Bool = false
        public var widthOfChange: WidthOfChangeStore.State?

        public init() { }
    }

    public enum Action: BindableAction, Equatable {
        case tapHeartButton
        case tapWidthOfChangeButton
        case tapComparisonButton(Bool)

        case binding(BindingAction<State>)
        case setupProfileScene(ProfileScene)
        case widthOfChange(WidthOfChangeStore.Action)
    }

    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
    }
}
