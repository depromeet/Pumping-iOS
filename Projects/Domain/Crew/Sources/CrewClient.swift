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
    public static let liveValue = CrewClient { crewName, goalCount in
        let makeCrewRequestDTO = MakeCrewRequestDTO(crewName: crewName, goalCount: goalCount)
        let apiEndpoint = CrewEndpoint.makeCrew(makeCrewRequestDTO)
        let response = try await NetworkProvider.shared.sendRequest(apiEndpoint).toDomain()
        
        return response        
    }
}

extension DependencyValues {
    public var crewClient: CrewClient {
        get { self[CrewClient.self] }
        set { self[CrewClient.self] = newValue }
    }
}
