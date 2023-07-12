//
//  CrewEndpoint.swift
//  DomainCrewInterface
//
//  Created by 박현우 on 2023/07/01.
//

import Foundation
import CoreNetworkInterface
import CoreKeyChainStore

public struct CrewEndpoint {
    public static func fetchCrew() -> Endpoint<CrewInfoResponseDTO> {
        let accessToken = KeyChainStore.shared.load(property: .accessToken)
        
        return Endpoint(path: "crews",
                        httpMethod: .get,
                        headers: ["Authorization" : "Bearer \(accessToken)"])
    }
    
    public static func makeCrew(_ requestDTO: MakeCrewRequestDTO) -> Endpoint<CrewDetailResponseDTO> {
        let accessToken = KeyChainStore.shared.load(property: .accessToken)
        
        return Endpoint(path: "crews",
                        httpMethod: .post,
                        bodyParameters: requestDTO,
                        headers: ["Authorization" : "Bearer \(accessToken)"])
    }
    
    public static func joinCrew(_ code: String) -> Endpoint<CrewDetailResponseDTO> {
        let accessToken = KeyChainStore.shared.load(property: .accessToken)
        
        return Endpoint(path: "crews/join/\(code)",
                        httpMethod: .post,
                        headers: ["Authorization" : "Bearer \(accessToken)"])
    }
}
