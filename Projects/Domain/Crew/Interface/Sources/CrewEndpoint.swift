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
    public static func makeCrew(_ requestDTO: MakeCrewRequestDTO) -> Endpoint<MakeCrewResponseDTO> {
        let accessToken = KeyChainStore.shared.load(property: .accessToken)
        
        return Endpoint(path: "crews",
                        httpMethod: .post,
                        bodyParameters: requestDTO,
                        headers: ["Authorization" : "Bearer \(accessToken)"])
    }
}
