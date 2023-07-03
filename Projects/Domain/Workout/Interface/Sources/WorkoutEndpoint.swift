//
//  WorkoutEndpoint.swift
//  DomainWorkoutInterface
//
//  Created by 송영모 on 2023/07/03.
//

import Foundation

import CoreNetworkInterface
import CoreKeyChainStore

public struct WorkoutEndpoint {
    public static func makeWorkout(_ requestDTO: MakeWorkoutRequestDTO) -> Endpoint<MakeWorkoutResponseDTO> {
        let accessToken = KeyChainStore.shared.load(property: .accessToken)
        
        return Endpoint(path: "workout",
                        httpMethod: .post,
                        bodyParameters: requestDTO,
                        headers: ["Authorization" : "Bearer \(accessToken)"])
    }
}
