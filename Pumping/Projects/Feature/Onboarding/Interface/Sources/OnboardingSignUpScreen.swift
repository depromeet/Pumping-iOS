//
//  OnboardingSignUpScreen.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/02.
//

import SwiftUI
import ComposableArchitecture

public struct OnboardingSignUpDependency: Equatable {
    let path: NavigationPath
    let nickname: String
    
    public init(path: NavigationPath, nickname: String) {
        self.path = path
        self.nickname = nickname
    }
}

public protocol OnboardingSignUpScreen: View {
    var dependency: OnboardingSignUpDependency { get }
}
