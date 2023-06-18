//
//  PumpingWorkoutCategoryIdentifier.swift
//  DomainWorkoutInterface
//
//  Created by 송영모 on 2023/06/17.
//

import Foundation

//MARK: WorkoutCategoryIdentifierType
public enum WorkoutCategoryIdentifierType: String, CaseIterable {
    case whole = "전신"
    case upper = "상체"
    case lower = "하체"
}

public extension WorkoutCategoryIdentifierType {
    var identifiers: [WorkoutCategoryIdentifier] {
        switch self {
        case .whole:
            return [.aerobic]
        case .upper:
            return [.shoulder, .chest, .arms, .back]
        case .lower:
            return [.butt]
        }
    }
}

//MARK: WorkoutCategoryIdentifier
public enum WorkoutCategoryIdentifier: String, CaseIterable {
    case aerobic = "유산소"
    case shoulder = "어깨"
    case chest = "가슴"
    case arms = "팔"
    case back = "등"
    case butt = "엉덩이"
}

public extension WorkoutCategoryIdentifier {
    var type: WorkoutCategoryIdentifierType {
        switch self {
        case .aerobic:
            return .whole
        case .shoulder, .chest, .arms, .back:
            return .upper
        case .butt:
            return .lower
        }
    }
}
