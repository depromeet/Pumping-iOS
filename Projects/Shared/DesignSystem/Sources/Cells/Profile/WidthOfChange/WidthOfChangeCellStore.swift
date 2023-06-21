//
//  WidthOfChangeCellStore.swift
//  SharedDesignSystem
//
//  Created by Derrick kim on 2023/06/14.
//

import SwiftUI
import ComposableArchitecture

public enum WidthOfChangeType: String, CaseIterable {
    case workoutTime = "운동시간"
    case calorie = "칼로리"
    case averageHeartRate = "평균 심박수"
    case maxWorkoutPart = "최대운동부위"

    var image: Image {
        switch self {
        case .workoutTime:
            return Image.widthOfChangeWorkoutTime
        case .calorie:
            return Image.widthOfChangeCalorie
        case .averageHeartRate:
            return Image.widthOfChangeHearRate
        case .maxWorkoutPart:
            return Image.widthOfChangeMaxWorkoutPart
        }
    }
}

public struct WidthOfChangeCellStore: ReducerProtocol {
    public struct State: Equatable, Identifiable {
        public let id: UUID
        public let title: WidthOfChangeType
        public let previousData: String
        public let currentData: String
        public let currentTime: String?

        public var isTapped: Bool = true

        public init(id: UUID,
                    title: WidthOfChangeType,
                    previousData: String,
                    currentData: String,
                    currentTime: String? = nil) {
            self.id = id
            self.title = title
            self.previousData = previousData
            self.currentData = currentData
            self.currentTime = currentTime
        }
    }

    public enum Action: Equatable {

    }

    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        
    }
}
