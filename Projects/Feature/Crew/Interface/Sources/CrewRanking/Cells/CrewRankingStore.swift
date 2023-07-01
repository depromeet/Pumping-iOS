//
//  CrewRankingCellStore.swift
//  SharedDesignSystem
//
//  Created by Derrick kim on 2023/06/22.
//

import SwiftUI
import ComposableArchitecture
import SharedDesignSystem

public enum CrewRankingType: String {
    case upperBody = "상체 머신"
    case lowerBody = "하체 머신"
    case lastPlace = "꼴찌의 전당"
    case workoutCumulativeTime = "운동 누적 시간"
    case cardio = "유산소킹"

    var backgroundImage: Image {
        switch self {
        case .upperBody:
            return SharedDesignSystemAsset.Images.crewRankingUpperBody.swiftUIImage

        case .lowerBody:
            return SharedDesignSystemAsset.Images.crewRankingLowerBody.swiftUIImage

        case .lastPlace:
            return   SharedDesignSystemAsset.Images.crewRankingLastPlace.swiftUIImage

        case .workoutCumulativeTime:
            return SharedDesignSystemAsset.Images.crewRankingWorkoutCumulativeTime.swiftUIImage

        case .cardio:
            return SharedDesignSystemAsset.Images.crewRankingCardio.swiftUIImage
        }
    }

    var avatar: Image {
        switch self {
        case .lowerBody:
            return SharedDesignSystemAsset.Images.crewRankingLowerBodyAvatar.swiftUIImage

        case .lastPlace:
            return   SharedDesignSystemAsset.Images.crewRankingLastPlaceAvatar.swiftUIImage

        case .workoutCumulativeTime:
            return SharedDesignSystemAsset.Images.crewRankingWorkoutCumulativeTimeAvatar.swiftUIImage

        default:
            return SharedDesignSystemAsset.Images.crewRankingCardioAvatar.swiftUIImage
        }
    }
}

public struct CrewRankingCellStore: ReducerProtocol {
    public init() { }

    public struct State: Equatable, Identifiable {
        public let id: UUID
        public let title: String
        public let ranking: String
        public let userName: String
        public let data: [String]

        public var isTapped: Bool = true

        public init(
            id: UUID,
            title: String,
            ranking: String,
            userName: String,
            data: [String]
        ) {
            self.id = id
            self.title = title
            self.ranking = ranking
            self.userName = userName
            self.data = data
        }
    }

    public enum Action: Equatable {
        case tapped
    }

    public func reduce(
        into state: inout State,
        action: Action
    ) -> EffectTask<Action> {
        switch action {
        case .tapped:
            return .none
        }
    }
}
