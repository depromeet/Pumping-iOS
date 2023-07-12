//
//  BypassCrewInfo.swift
//  DomainCrewInterface
//
//  Created by 송영모 on 2023/07/13.
//

import Foundation

import Foundation

public struct BypassCrewInfo: Equatable {
    public let crewId, crewName, code, createDate: String
    public let goalCount: Int
    public let message: String
    public let participants: [String]
    public let memberInfo: [BypassMemberInfo]
}

// MARK: - BypassMemberInfo
public struct BypassMemberInfo: Equatable {
    public let userId, userName, profileImage: String
    public let workoutCount: Int?
    public let goalCount: Int
    public let workoutTime: Int?
}
