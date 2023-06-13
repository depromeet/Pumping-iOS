//
//  WidthOfChangeType.swift
//  FeatureProfile
//
//  Created by Derrick kim on 2023/06/13.
//

import SharedDesignSystem
import SwiftUI

public enum WidthOfChangeType: String, CaseIterable {
    case workTime = "운동시간"
    case calorie = "칼로리"
    case averageHeartRate = "평균 심박수"
    case maximumPart = "최대운동부위"

    var image: Image {
        switch self {
        case .workTime:
            return SharedDesignSystemAsset.Images.widthOfChangeWorkoutTime.swiftUIImage
        case .calorie:
            return SharedDesignSystemAsset.Images.widthOfChangeCalorie.swiftUIImage
        case .averageHeartRate:
            return SharedDesignSystemAsset.Images.widthOfChangeHearRate.swiftUIImage
        case .maximumPart:
            return SharedDesignSystemAsset.Images.widthOfChangeMaximumPart.swiftUIImage
        }
    }
}
