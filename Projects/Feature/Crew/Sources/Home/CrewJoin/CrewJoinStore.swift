//
//  CrewJoinStore.swift
//  FeatureCrewInterface
//
//  Created by 박현우 on 2023/06/27.
//

import ComposableArchitecture
import FeatureCrewInterface
import Domain

extension CrewJoinStore {
    public init() {
        @Dependency(\.crewClient) var crewClient
        
        let reducer: Reduce<State, Action> = .init { state, action in
            switch action {
            case .binding:
                if state.code.count > 0 && state.code.count < 16 {
                    state.isSatisfied = true
                } else {
                    state.isSatisfied = false
                }
                
                return .none
                
            case .dismissCrewJoinView:
                state.code = ""
                return .none

            case .joinCrew:
                return .task { [code = state.code] in
                    await .joinCrewResponse(
                        TaskResult {
                            try await crewClient.joinCrew(code)
                        }
                    )
                }
                
            case let .joinCrewResponse(.success(crewInfo)):
                print(crewInfo)
                return .send(.dismissCrewJoinView)
                
            case let .joinCrewResponse(.failure(error)):
                print(error.localizedDescription)
                return .none
                
            default:
                return .none
            }
        }
        
        self.init(
            reducer: reducer
        )
    }
}
