//
//  CrewHomeStore.swift
//  FeatureCrew
//
//  Created by Derrick kim on 2023/06/13.
//

import ComposableArchitecture
import FeatureCrewInterface

import Domain
import Core
import Shared

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
                guard let userRecord = state.userRecordList.first(where: { $0.id == id }) else { return .none }
                //FIXME: 상상 코딩 부분 - 셀을 누르면 userId를 profile View로 넘겨줌. 그리고 profile View에서 onAppear로 fetching
                switch action {
                case .tapped:
                    return .send(.goToProfileView(userRecord.userId))
                }
                
            case .fetchUserRequest:
                return .task {
                    await .fetchUserResponse(
                        TaskResult {
                            try await userClient.fetchUser()
                        }
                    )
                }
                
            case let .fetchUserResponse(.success(userInfo)):
                //FIXME: 원래 이부분에서 bypass 요청을 보내는 것이 옳음
                if let crewId = userInfo.currentCrew {
                    state.currentCrewId = crewId
                    return .send(.bypassFetchCrewRequest(crewId))
                }
                
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
                if let crewId = crewList.first?.crewId {
                    return .send(.bypassFetchCrewRequest(crewId))
                }
                
                return .none

            case let .fetchCrewResponse(.failure(error)):
                print(error)
                return .none
                
            case let .bypassFetchCrewRequest(crewId):
                let userId = KeyChainStore.shared.load(property: .userId)
                return .task {
                    await .bypassFetchCrewResponse(
                        TaskResult {
                            try await crewClient.bypassFetchCrew(userId, crewId)
                        }
                    )
                }
                
            case let .bypassFetchCrewResponse(.success(bypassCrewInfo)):
                state.profileList = .init(
                    uniqueElements: bypassCrewInfo.memberInfo.enumerated().map { index, member in
                        return .init(id: .init(), ranking: "\(index+1)", userName: member.userName, characterType: CharacterType(rawValue: member.profileImage) ?? .a, workoutTime: DateManager.toClockString(from: member.workoutTime ?? 0))
                })
                
                state.userRecordList = .init(
                    uniqueElements: bypassCrewInfo.memberInfo.enumerated().map { index, member in
                        return .init(id: .init(), userId: member.userId, characterType: CharacterType(rawValue: member.profileImage) ?? .a, ranking: "\(index+1)", userName: member.userName, numberOfExerciseGoals: "\(member.goalCount)", workoutTime: DateManager.toClockString(from: member.workoutTime ?? 0))
                })
                
                state.crewName = bypassCrewInfo.crewName
                state.crewMessage = bypassCrewInfo.message
                
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
