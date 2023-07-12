//
//  BypassFetchCrewResponseDTO.swift
//  DomainCrewInterface
//
//  Created by 송영모 on 2023/07/13.
//

import Foundation

public struct BypassFetchCrewResponseDTO: Codable {
    public let crewID, crewName, code, createDate: String
    public let goalCount: Int
    public let message: String
    public let participants: [String]
    public let memberInfo: [BypassMemberInfoDTO]

    enum CodingKeys: String, CodingKey {
        case crewID = "crewId"
        case crewName, code, createDate, goalCount, message, participants, memberInfo
    }
    
    public func toDomain() -> BypassCrewInfo {
        return .init(
            crewId: crewID,
            crewName: crewName,
            code: code,
            createDate: createDate,
            goalCount: goalCount,
            message: message,
            participants: participants,
            memberInfo: memberInfo.map {
                BypassMemberInfo(
                    userId: $0.userID,
                    userName: $0.userName,
                    profileImage: $0.profileImage,
                    workoutCount: $0.workoutCount,
                    goalCount: $0.goalCount,
                    workoutTime: $0.workoutTime
                )
            }
        )
    }
}

// MARK: - BypassMemberInfo
public struct BypassMemberInfoDTO: Codable {
    public let userID, userName, profileImage: String
    public let workoutCount: Int?
    public let goalCount: Int
    public let workoutTime: Int?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case userName, profileImage, workoutCount, goalCount, workoutTime
    }
}
