//
//  CrewHomeStoreInterface.swift
//  FeatureCrewInterface
//
//  Created by Derrick kim on 2023/06/13.
//

import ComposableArchitecture

import DomainUserInterface
import DomainCrewInterface

import SharedDesignSystem

public struct CrewHomeStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>
    private let crewJoinStore: CrewJoinStore
    private let crewMakeStore: CrewMakeStore

    public init(
        reducer: Reduce<State, Action>,
        crewJoinStore: CrewJoinStore,
        crewMakeStore: CrewMakeStore
    ) {
        self.reducer = reducer
        self.crewJoinStore = crewJoinStore
        self.crewMakeStore = crewMakeStore
    }
    
    public struct State: Equatable {
        @BindingState public var showCrewListView: Bool = false
        @BindingState public var showCrewJoinView: Bool = false
        @BindingState public var showCrewMakeView: Bool = false
        
        public var crewJoin: CrewJoinStore.State?
        public var crewMake: CrewMakeStore.State?
        
        public var crewList: [CrewInfo] = []
        public var currentCrewId: String?
        
        public var userRecordList: IdentifiedArrayOf<PersonalRecordCellStore.State> = []
        public var profileList: IdentifiedArrayOf<ProfileBodyCellStore.State> = []
        public var crewName: String?
        public var crewMessage: String?
        

        public init() {
            
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case onAppear
        
        case tapCrewJoinButton
        case tapCrewMakeButton
        
        case fetchUserRequest
        case fetchUserResponse(TaskResult<UserInfo>)
        case fetchCrewRequest
        case fetchCrewResponse(TaskResult<[CrewInfo]>)
        case bypassFetchCrewRequest(String)
        case bypassFetchCrewResponse(TaskResult<BypassCrewInfo>)
        
        case presentCrewListView
        case presentCrewJoinView
        case presentCrewMakeView
        
        case crewJoin(CrewJoinStore.Action)
        case crewMake(CrewMakeStore.Action)

        case profileBodyCell(id: ProfileBodyCellStore.State.ID, action: ProfileBodyCellStore.Action)
        case personalRecordCell(id: PersonalRecordCellStore.State.ID, action: PersonalRecordCellStore.Action)
        
        // navigation
        case goToProfileView(String)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
            .ifLet(\.crewJoin, action: /Action.crewJoin) {
                crewJoinStore
            }
            .ifLet(\.crewMake, action: /Action.crewMake) {
                crewMakeStore
            }
    }
}
