//
//  CrewMakeStore.swift
//  FeatureCrewInterface
//
//  Created by 박현우 on 2023/06/27.
//

import ComposableArchitecture
import FeatureCrewInterface
import Domain
import UIKit

extension CrewMakeStore {
    public init() {
        @Dependency(\.crewClient) var crewClient
        
        let reducer: Reduce<State, Action> = .init { state, action in
            switch action {
            case .binding:
                if state.crewName.count > 0 && state.crewName.count < 16 {
                    state.isSatisfied = true
                } else {
                    state.isSatisfied = false
                }
                return .none
                
            case .goToCrewMakeCompleteView:
                state.showCrewMakeCompleteView = true
                return .none
                
            case .dismissCrewMakeView:
                state.crewName = ""
                state.goalCount = 0
                state.showCrewMakeCompleteView = false
                return .none
                
            case .addGoalCount:
                guard state.goalCount < 7 else {
                    return .none
                }
                
                state.goalCount += 1
                return .none
                
            case .subGoalCount:
                guard state.goalCount != 1 else {
                    return .none
                }
                
                state.goalCount -= 1
                return .none
                
            case .copyCode:
                UIPasteboard.general.string = state.receivedCrewInfo?.code
                return .none
                
            case .makeCrew:
                return .task { [crewName = state.crewName, goalCount = state.goalCount] in
                    await .makeCrewResponse(
                        TaskResult {
                            try await crewClient.makeCrew(crewName, goalCount)
                        }
                    )
                }
                
            case let .makeCrewResponse(.success(crewInfo)):
                print(crewInfo)
                state.receivedCrewInfo = crewInfo
                return .send(.goToCrewMakeCompleteView)
                
            case let .makeCrewResponse(.failure(error)):
                print(error)
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
