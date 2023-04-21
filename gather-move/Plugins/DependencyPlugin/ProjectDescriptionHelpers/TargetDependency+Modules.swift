//
//  TargetDependency+Modules.swift
//  DependecnyPlugin
//
//  Created by 송영모 on 2023/04/21.
//

import ProjectDescription
import Foundation

// MARK: - Application

extension TargetDependency {
    
    private static func application(target: String, moduleName: String) -> TargetDependency {
        .project(target: target, path: .relativeToRoot("Projects/Application/" + moduleName))
    }
    
    public static func application(interface moduleName: ApplicationModule) -> TargetDependency {
        .feature(target: moduleName.rawValue + "ApplicationInterface", moduleName: moduleName.rawValue)
    }
    
    public static func application(implementation moduleName: ApplicationModule) -> TargetDependency {
        .feature(target: moduleName.rawValue + "Application", moduleName: moduleName.rawValue)
    }
    
    public static func application(testing moduleName: ApplicationModule) -> TargetDependency {
        .feature(target: moduleName.rawValue + "ApplicationTesting", moduleName: moduleName.rawValue)
    }
}

// MARK: - Feature

extension TargetDependency {
    
    private static func feature(target: String, moduleName: String) -> TargetDependency {
        .project(target: target, path: .relativeToRoot("Projects/Feature/" + moduleName))
    }
    
    public static func feature(interface moduleName: FeatureModule) -> TargetDependency {
        .feature(target: moduleName.rawValue + "FeatureInterface", moduleName: moduleName.rawValue)
    }
    
    public static func feature(implementation moduleName: FeatureModule) -> TargetDependency {
        .feature(target: moduleName.rawValue + "Feature", moduleName: moduleName.rawValue)
    }
    
    public static func feature(testing moduleName: FeatureModule) -> TargetDependency {
        .feature(target: moduleName.rawValue + "FeatureTesting", moduleName: moduleName.rawValue)
    }
}


// MARK: - Core

extension TargetDependency {
    
    private static func core(target: String, moduleName: String) -> TargetDependency {
        .project(target: target, path: .relativeToRoot("Projects/Core/" + moduleName))
    }
    
    public static func core(interface moduleName: CoreModule) -> TargetDependency {
        .core(target: moduleName.rawValue + "Interface", moduleName: moduleName.rawValue)
    }
    
    public static func core(implementation moduleName: CoreModule) -> TargetDependency {
        .core(target: moduleName.rawValue, moduleName: moduleName.rawValue)
    }
    
    public static func core(testing moduleName: CoreModule) -> TargetDependency {
        .core(target: moduleName.rawValue + "Testing", moduleName: moduleName.rawValue)
    }
}
