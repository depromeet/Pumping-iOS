//
//  WorkoutCategory.swift
//  AppWatchExtension
//
//  Created by 송영모 on 2023/07/04.
//

import Foundation

//MARK: WorkoutCategory

public enum WorkoutCategory: String, CaseIterable, Codable {
    case whole = "WHOLE"
    case up = "UP"
    case down = "DOWN"
}

public extension WorkoutCategory {
    var title: String {
        switch self {
        case .whole: return "전신"
        case .up: return "상체"
        case .down: return "하체"
        }
    }
    
    var parts: [WorkoutPart] {
        switch self {
        case .whole:
            return [.aerobic]
        case .up:
            return [.shoulder, .chest, .arm, .back]
        case .down:
            return [.hip]
        }
    }
}

//MARK: WorkoutPart

public enum WorkoutPart: String, CaseIterable, Equatable, Codable {
    case aerobic = "AEROBIC"
    case shoulder = "SHOULDER"
    case chest = "CHEST"
    case arm = "ARM"
    case back = "BACK"
    case hip = "HIP"
    case leg = "LEG"
}

public extension WorkoutPart {
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
    
    var category: WorkoutCategory {
        switch self {
        case .aerobic: return .whole
        case .shoulder, .chest, .arm, .back: return .up
        case .hip, .leg: return .down
        }
    }
}
