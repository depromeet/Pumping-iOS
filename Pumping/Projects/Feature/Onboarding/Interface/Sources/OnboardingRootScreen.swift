//
//  OnboardingRootScreen.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/02.
//

import SwiftUI
import ComposableArchitecture

//public struct OnboardingRootDependency: Equatable {
//    let path: NavigationPath
//}

public protocol OnboardingRootScreen: View {
//    var dependency: OnboardingRootDependency { get }
}

//public struct OnboardingRoot: ReducerProtocol {
//    public struct State: Equatable {
//        var path = NavigationPath()
//    }
//
//    public enum Action: Equatable, Sendable {
//
//    }
//
//    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
//
//    }
//}
//
//public protocol OnboardingRootScreen: View {
//    var store: StoreOf<OnboardingRoot> { get }
//}
