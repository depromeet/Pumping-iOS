//
//  RootScene.swift
//  Feature
//
//  Created by 박현우 on 2023/06/02.
//

import SwiftUI

import SharedDesignSystem

public enum MainScene: Hashable {
    case home
    case workout
    case myPage
    
    var title: String {
        switch self {
        case .home:
            return "홈"
        case .workout:
            return "운동"
        case .myPage:
            return "마이"
        }
    }
    
    var image: Image {
        switch self {
        case .home:
            return PumpingImages.home.swiftUIImage
        case .workout:
            return PumpingImages.home.swiftUIImage
        case .myPage:
            return PumpingImages.mypage.swiftUIImage
        }
    }
}
