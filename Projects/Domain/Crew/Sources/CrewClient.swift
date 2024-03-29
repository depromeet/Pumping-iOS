//
//  CrewClient.swift
//  DomainCrewInterface
//
//  Created by 박현우 on 2023/07/01.
//

import Foundation
import ComposableArchitecture
import DomainCrewInterface
import CoreNetwork

extension CrewClient: DependencyKey {
    public static let liveValue = CrewClient(
        bypassFetchCrew: { userId, crewId in
            let bypassFetchCrewRequestDTO = BypassFetchCrewRequestDTO(userID: userId, crewID: crewId)
            let apiEndpoint = CrewEndpoint.bypassFetchCrew(bypassFetchCrewRequestDTO)
            let response = try await NetworkProvider.shared.sendRequest(apiEndpoint, isBypass: true).toDomain()
            
            return response
        },
        fetchCrew: {
            let apiEndpoint = CrewEndpoint.fetchCrew()
            let response = try await NetworkProvider.shared.sendRequest(apiEndpoint).toDomain()
            
            return response
        },
        makeCrew: { crewName, goalCount in
            let makeCrewRequestDTO = MakeCrewRequestDTO(crewName: crewName, goalCount: goalCount)
            let apiEndpoint = CrewEndpoint.makeCrew(makeCrewRequestDTO)
            let response = try await NetworkProvider.shared.sendRequest(apiEndpoint).toDomain()
            
            return response
        },
        joinCrew: { code in
            let apiEndpoint = CrewEndpoint.joinCrew(code)
            let response = try await NetworkProvider.shared.sendRequest(apiEndpoint).toDomain()
            
            return response
        }
    )
    
}

extension DependencyValues {
    public var crewClient: CrewClient {
        get { self[CrewClient.self] }
        set { self[CrewClient.self] = newValue }
    }
}
