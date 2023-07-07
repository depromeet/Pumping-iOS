//
//  MakeWorkoutResponseDTO.swift
//  DomainWorkoutInterface
//
//  Created by 송영모 on 2023/07/03.
//

import Foundation

public struct MakeWorkoutResponseDTO: Codable {
    let uid: String
}


public extension MakeWorkoutResponseDTO {
    func toDomain() -> String {
        return uid
    }
}
