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
            return [.shoulder, .chest, .arm, .back]
        case .lower:
            return [.hip]
        }
    }
}

//MARK: WorkoutCategoryIdentifier

public enum WorkoutCategoryIdentifier: String, CaseIterable, Equatable {
    case aerobic = "AEROBIC"
    case shoulder = "SHOULDER"
    case chest = "CHEST"
    case arm = "ARM"
    case back = "BACK"
    case hip = "HIP"
    case leg = "LEG"
}

public extension WorkoutCategoryIdentifier {
    var title: String {
        switch self {
        case .aerobic: return "유산소"
        case .shoulder: return "어깨"
        case .chest: return "가슴"
        case .arm: return "팔"
        case .back: return "등"
        case .hip: return "엉덩이"
        case .leg: return "다리"
        }
    }
    
    var type: WorkoutCategoryIdentifierType {
        switch self {
        case .aerobic: return .whole
        case .shoulder, .chest, .arm, .back: return .upper
        case .hip, .leg: return .lower
        }
    }
}
