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
        fetchCrew: {
            let apiEndpoint = CrewEndpoint.fetchCrew()
            let responseDTOList = try await NetworkProvider.shared.sendRequest(apiEndpoint)
            let responseList = responseDTOList.map {
                CrewInfo(crewName: $0.crewName, crewId: $0.crewId, createDate: $0.createDate)
            }
            
            return responseList
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
