//
//  OnboardingNicknameScreen.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/02.
//

import SwiftUI
import ComposableArchitecture

public struct OnboardingNicknameDependency: Equatable {
    public var path: NavigationPath
    
    public init(path: NavigationPath) {
        self.path = path
    }
}

public protocol OnboardingNicknameScreen: View {
    var dependency: OnboardingNicknameDependency { get }
}
