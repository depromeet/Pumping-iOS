//
//  CrewEndpoint.swift
//  DomainCrewInterface
//
//  Created by 박현우 on 2023/07/01.
//

import Foundation
import CoreNetworkInterface

public struct CrewEndpoint {
    public static func makeCrew(_ requestDTO: MakeCrewRequestDTO) -> Endpoint<MakeCrewResponseDTO> {
        return Endpoint(path: "crew/create", httpMethod: .post, bodyParameters: requestDTO)
    }
}
