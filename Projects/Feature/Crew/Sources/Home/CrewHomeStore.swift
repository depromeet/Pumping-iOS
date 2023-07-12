//
//  CrewHomeStore.swift
//  FeatureCrew
//
//  Created by Derrick kim on 2023/06/13.
//

import ComposableArchitecture
import FeatureCrewInterface
import Domain
import SharedDesignSystem

extension CrewHomeStore {
    public init() {
        @Dependency(\.crewClient) var crewClient
        @Dependency(\.userClient) var userClient
        
        let reducer: Reduce<State, Action> = .init { state, action in
            switch action {
            case .binding:
                return .none
                
            case .onAppear:
                return .concatenate([
                    .send(.fetchCrewRequest),
                    .send(.fetchUserRequest)
                ])
                
            case .tapCrewJoinButton:
                return .send(.presentCrewJoinView)
                
            case .tapCrewMakeButton:
                return .send(.presentCrewMakeView)
                
            case let .profileBodyCell(id, action):
                return .none
                
            case let .personalRecordCell(id, action):
                return .none
                
            case .fetchUserRequest:
                return .task {
                    await .fetchUserResponse(
                        TaskResult {
                            try await userClient.fetchUser()
                        }
                    )
                }
                
            case let .fetchUserResponse(.success(userInfo)):
                state.currentCrewId = userInfo.currentCrew
                return .none
                
            case .fetchCrewRequest:
                return .task {
                    await .fetchCrewResponse(
                        TaskResult {
                            try await crewClient.fetchCrew()
                        }
                    )
                }

            case let .fetchCrewResponse(.success(crewList)):
                state.crewList = crewList
                print(crewList)
                return .none

            case let .fetchCrewResponse(.failure(error)):
                print(error)
                return .none
                
            case .presentCrewListView:
                state.showCrewListView = true
                return .none
                
            case .presentCrewJoinView:
                state.crewJoin = .init()
                state.showCrewJoinView = true
                return .none
                
            case .presentCrewMakeView:
                state.crewMake = .init()
                state.showCrewMakeView = true
                return .none
                
            case .crewJoin(.dismissCrewJoinView):
                state.crewJoin = nil
                state.showCrewJoinView = false
                return .none
                
            case .crewMake(.dismissCrewMakeView):
                state.crewMake = nil
                state.showCrewMakeView = false
                return .none
                
            case .crewJoin(.isCrewJoinCompleted):
                // 크루에 성공적으로 합류했을때 리스트를 reload
                return .none
                
            case .crewMake(.isCrewMakeCompleted):
                // 크루를 성공적으로 만들었을때 리스트를 reload
                return .none
                
            default:
                return .none
            }
        }
        
        self.init(
            reducer: reducer,
            crewJoinStore: CrewJoinStore(),
            crewMakeStore: CrewMakeStore()
        )
    }
}
