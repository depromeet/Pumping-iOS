//
//  ProjectDescription+Path.swift
//  DependencyPlugin
//
//  Created by 송영모 on 2023/04/27.
//

import Foundation
import ProjectDescription

// MARK: ProjectDescription.Path + App

public extension ProjectDescription.Path {
    static var app: Self {
        return .relativeToRoot("Projects/\(AppModule.name)")
    }
}

// MARK: ProjectDescription.Path + Feature

public extension ProjectDescription.Path {
    static var feature: Self {
        return .relativeToRoot("Projects/\(FeatureModule.name)")
    }
    
    static func feature(implementation module: FeatureModule) -> Self {
        return .relativeToRoot("Projects/\(FeatureModule.name)/\(module.rawValue)")
    }
}

// MARK: ProjectDescription.Path + Domain

public extension ProjectDescription.Path {
    static var domain: Self {
        return .relativeToRoot("Projects/\(DomainModule.name)")
    }
    
    static func domain(implementation module: DomainModule) -> Self {
        return .relativeToRoot("Projects/\(DomainModule.name)/\(module.rawValue)")
    }
}

// MARK: ProjectDescription.Path + Core

public extension ProjectDescription.Path {
    static var core: Self {
        return .relativeToRoot("Projects/\(CoreModule.name)")
    }
    
    static func core(implementation module: CoreModule) -> Self {
        return .relativeToRoot("Projects/\(CoreModule.name)/\(module.rawValue)")
    }
}

// MARK: ProjectDescription.Path + Shared

public extension ProjectDescription.Path {
    static var shared: Self {
        return .relativeToRoot("Projects/\(SharedModule.name)")
    }
    
    static func shared(implementation module: SharedModule) -> Self {
        return .relativeToRoot("Projects/\(SharedModule.name)/\(module.rawValue)")
    }
}

// MARK: ProjectDescription.Path + WatchShared

public extension ProjectDescription.Path {
    static var watchShared: Self {
        return .relativeToRoot("Projects/\(WatchSharedModule.name)")
    }
    
    static func watchShared(implementation module: WatchSharedModule) -> Self {
        return .relativeToRoot("Projects/\(WatchSharedModule.name)/\(module.rawValue)")
    }
}
