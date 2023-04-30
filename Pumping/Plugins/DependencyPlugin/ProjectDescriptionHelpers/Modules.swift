//
//  Modules.swift
//  DependencyPlugin
//
//  Created by 송영모 on 2023/04/27.
//

import Foundation
import ProjectDescription

public enum MicroFeatureType: String, CaseIterable {
    case Example
    case Sources
    case Tests
    case Testing
    case Interface
}

// MARK: AppModule

public enum AppModule: String, CaseIterable {
    public static let name: String = "App"

    case IOS
    case Watch
    case WatchExtension
}

// MARK: DomainModule

public enum DomainModule: String, CaseIterable {
    public static let name: String = "Domain"

    case Health
    case Login
}

// MARK: FeatureModule

public enum FeatureModule: String, CaseIterable {
    public static let name: String = "Feature"

    case Onboarding
    case Home
    case MyPage
}

// MARK: CoreModule

public enum CoreModule: String, CaseIterable {
    public static let name: String = "Core"

    case Network
}

// MARK: SharedModule

public enum SharedModule: String, CaseIterable {
    public static let name: String = "Shared"

    case DesignSystem
    case ThirdPartyLib
}

// MARK: WatchSharedModule

public enum WatchSharedModule: String, CaseIterable {
    public static let name: String = "WatchShared"

    case DesignSystem
    case ThirdPartyLib
}
