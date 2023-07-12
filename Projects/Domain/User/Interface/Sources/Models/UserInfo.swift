//
//  UserInfo.swift
//  DomainUserInterface
//
//  Created by 송영모 on 2023/07/13.
//

import Foundation
import DomainAuthInterface

public struct UserInfo : Equatable {
    public let name: String
    public let characterType: CharacterType
    public let currentCrew: String?
}
