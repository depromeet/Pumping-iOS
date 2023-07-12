//
//  CrewRootStoreInterface.swift
//  FeatureCrewInterface
//
//  Created by Derrick kim on 2023/06/13.
//

import ComposableArchitecture
import SharedDesignSystem
import FeatureProfileInterface

import Domain

public enum CrewScene: Hashable {
    case crewRanking
    case profile
    case widthOfChange
}

public struct CrewRootStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>

    public let profileHomeStore: ProfileHomeStore
    public let profileWidthOfChangeStore: ProfileWidthOfChangeStore
    
    private let crewHomeStore: CrewHomeStore
    private let crewRankingStore: CrewRankingStore

    public init(
        reducer: Reduce<State, Action>,
        profileHomeStore: ProfileHomeStore,
        profileWidthOfChangeStore: ProfileWidthOfChangeStore,
        crewHomeStore: CrewHomeStore,
        crewRankingStore: CrewRankingStore
    ) {
        self.reducer = reducer
        
        self.profileHomeStore = profileHomeStore
        self.profileWidthOfChangeStore = profileWidthOfChangeStore
        self.crewHomeStore = crewHomeStore
        self.crewRankingStore = crewRankingStore
    }
    
    public struct State: Equatable {
        @BindingState public var path: [CrewScene] = []
        @BindingState public var showingCrew: Bool = false

        // child
        public var crewHome: CrewHomeStore.State
        public var crewRanking: CrewRankingStore.State?
        public var profileHome: ProfileHomeStore.State?
        public var profileWidthOfChange: ProfileWidthOfChangeStore.State?

        public init(crewList: [CrewInfo]) {
            self.crewHome = .init(crewList: crewList)
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case crewHome(CrewHomeStore.Action)
        case crewRanking(CrewRankingStore.Action)
        case profileHome(ProfileHomeStore.Action)
        case profileWidthOfChange(ProfileWidthOfChangeStore.Action)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()

        Scope(state: \.crewHome, action: /Action.crewHome) {
            crewHomeStore
        }

        reducer
            .ifLet(\.crewRanking, action: /Action.crewRanking) {
                crewRankingStore
            }
            .ifLet(\.profileHome, action: /Action.profileHome) {
                profileHomeStore
            }
    }
}
