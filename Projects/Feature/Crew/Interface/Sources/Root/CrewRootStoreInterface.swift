//
//  CrewRootStoreInterface.swift
//  FeatureCrewInterface
//
//  Created by Derrick kim on 2023/06/13.
//

import ComposableArchitecture
import SharedDesignSystem
import FeatureProfileInterface

public enum CrewScene: Hashable {
    case crewRanking
    case profile
    case widthOfChange
}

public struct CrewRootStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>

    private let crewHomeStore: CrewHomeStore
    private let crewStore: CrewStore
    private let crewRankingStore: CrewRankingStore
    private let profileStore: ProfileStore
    private let widthOfChangeStore: WidthOfChangeStore
    
    public init(
        reducer: Reduce<State, Action>,
        crewHomeStore: CrewHomeStore,
        crewStore: CrewStore,
        crewRankingStore: CrewRankingStore,
        profileStore: ProfileStore,
        widthOfChangeStore: WidthOfChangeStore
    ) {
        self.reducer = reducer
        self.crewHomeStore = crewHomeStore
        self.crewStore = crewStore
        self.crewRankingStore = crewRankingStore
        self.profileStore = profileStore
        self.widthOfChangeStore = widthOfChangeStore
    }
    
    public struct State: Equatable {
        @BindingState public var path: [CrewScene] = []
        public var crewHome: CrewHomeStore.State = .init()
        @BindingState public var showingCrew: Bool = false

        public var crew: CrewStore.State?
        public var profile: ProfileStore.State?
        public var widthOfChange: WidthOfChangeStore.State?
        public var crewRanking: CrewRankingStore.State?

        public init() { }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case crewHome(CrewHomeStore.Action)
        case crew(CrewStore.Action)
        case crewRanking(CrewRankingStore.Action)
        case profile(ProfileStore.Action)
        case widthOfChange(WidthOfChangeStore.Action)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()

        Scope(state: \.crewHome, action: /Action.crewHome) {
            crewHomeStore
        }

        reducer
            .ifLet(\.crew, action: /Action.crew) {
                crewStore
            }
            .ifLet(\.crewRanking, action: /Action.crewRanking) {
                crewRankingStore
            }
            .ifLet(\.profile, action: /Action.profile) {
                profileStore
            }
            .ifLet(\.widthOfChange, action: /Action.widthOfChange) {
                widthOfChangeStore
            }
    }
}
