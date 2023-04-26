//
//  GeneratedModules.swift
//  DependencyPlugin
//
//  Created by 송영모 on 2023/04/22.
//

import Foundation
import ProjectDescription

public enum MicroModuleType: String {
    case Source
    case Interface
    case Tests
    case Testing
}

public protocol ModuleType {
    var moduleName: String { get }
    associatedtype TargetType: RawRepresentable where TargetType.RawValue: StringProtocol
    
    func path(target: TargetType?, micro: MicroModuleType) -> Path
    func name(target: TargetType?, micro: MicroModuleType) -> String
    func bundleId(target: TargetType?, micro: MicroModuleType) -> String
    
    func target(
        target: TargetType?,
        micro: MicroModuleType,
        platform: Platform,
        dependencies: [TargetDependency]
    ) -> Target
    func targetDependency(target: TargetType?, micro: MicroModuleType?) -> TargetDependency
}

extension ModuleType {
    public func path(target: TargetType? = nil, micro: MicroModuleType = .Source) -> Path {
        guard let target = target else {
            return .relativeToRoot("Projects/\(moduleName)")
        }
        
        switch micro {
        case .Source: /// ex: Projects/Feature/Health
            return .relativeToRoot("Projects/\(moduleName)/\(target.rawValue)")
            
        default: /// ex: Projects/Feature/Health/Interface
            return .relativeToRoot("Projects/\(moduleName)/\(target.rawValue)/\(micro.rawValue)")
        }
    }
    
    public func name(target: TargetType? = nil, micro: MicroModuleType = .Source) -> String {
        guard let target = target else {
            return "\(moduleName)" /// ex: Feature
        }
        
        switch micro {
        case .Source: /// ex: FeatureHealth
            return "\(moduleName)\(target.rawValue)"
            
        default: /// ex: FeatureHealthInterface
            return "\(moduleName)\(target.rawValue)\(micro.rawValue)"
        }
    }
    
    public func bundleId(target: TargetType? = nil, micro: MicroModuleType = .Source) -> String {
        guard let target = target else {
            return "com.82.team.gathermove.\(self.name(target: target, micro: micro))"
        }
        
        switch micro {
        case .Source:
            return "com.82team.gathermove.\(moduleName.lowercased()).\(target.rawValue.lowercased())"
            
        default:
            return "com.82team.gathermove.\(moduleName.lowercased()).\(target.rawValue.lowercased()).\(micro.rawValue.lowercased())"
        }
    }
    
    public func target(
        target: TargetType? = nil,
        micro: MicroModuleType = .Source,
        platform: Platform = .iOS,
        dependencies: [TargetDependency] = []
    ) -> Target {
        guard let target = target else {
            return .init(
                name: self.name(target: target, micro: micro),
                platform: platform,
                product: .framework,
                bundleId: self.bundleId(target: target, micro: micro),
                sources: ["Sources/**"],
                dependencies: dependencies
            )
        }
        
        switch micro {
        case .Source:
            return .init(
                name: self.name(target: target, micro: micro),
                platform: platform,
                product: .framework,
                bundleId: self.bundleId(target: target, micro: micro),
                sources: ["Sources/**"],
                dependencies: dependencies
            )
            
        case .Interface:
            return .init(
                name: self.name(target: target, micro: micro),
                platform: platform,
                product: .framework,
                bundleId: self.bundleId(target: target, micro: micro),
                sources: ["\(micro.rawValue)/Sources/**"],
                dependencies: dependencies
            )
            
        case .Tests:
            return .init(
                name: self.name(target: target, micro: micro),
                platform: platform,
                product: .unitTests,
                bundleId: self.bundleId(target: target, micro: micro),
                sources: ["\(micro.rawValue)/Sources/**"],
                dependencies: dependencies
            )
            
        default:
            return .init(
                name: self.name(target: target, micro: micro),
                platform: platform,
                product: .staticFramework,
                bundleId: self.bundleId(target: target, micro: micro),
                sources: ["\(micro.rawValue)/Sources/**"],
                dependencies: dependencies
            )
        }
    }
    
    // TODO: TargetDependency의 Extension으로 관리 필요성
    public func targetDependency(target: TargetType? = nil, micro: MicroModuleType? = nil) -> TargetDependency {
        guard let target = target else {
            return .project(
                target: self.name(target: target),
                path: self.path(target: target)
            )
        }
        
        guard let micro = micro else {
            return .project(
                target: self.name(target: target),
                path: self.path(target: target)
            )
        }
        
        switch micro {
        case .Source:
            return .target(name: "\(moduleName)\(target.rawValue)")
            
        default:
            return .target(name: "\(moduleName)\(target.rawValue)\(micro.rawValue)")
        }
    }
}

// MARK: AppModuleType

public class AppModuleType: ModuleType {
    public let moduleName: String = "App"
    
    public enum TargetType: String {
        case IOS
        case Watch
        case WatchExtension
    }
}

// MARK: DomainModuleType

public class DomainModuleType: ModuleType {
    public let moduleName: String = "Domain"
    
    public enum TargetType: String {
        case Onboarding
        case Home
        case MyPage
    }
}

// MARK: FeatureModuleType

public class FeatureModuleType: ModuleType {
    public let moduleName: String = "Feature"
    
    public enum TargetType: String {
        case Home
        case Health
        case Login
    }
}

// MARK: CoreModuleType

public class CoreModuleType: ModuleType {
    public let moduleName: String = "Core"
    
    public enum TargetType: String {
        case Network
        case Utility
    }
}

// MARK: ThirdPartyLibType

public class ThirdPartyLibType: ModuleType {
    public let moduleName: String = "ThirdPartyLib"
    
    public enum TargetType: String {
        case none
    }
}

// MARK: WatchThirdPartyLibType

public class WatchThirdPartyLibType: ModuleType {
    public let moduleName: String = "WatchThirdPartyLib"
    
    public enum TargetType: String {
        case none
    }
}

public let AppModule = AppModuleType()
public let DomainModule = DomainModuleType()
public let FeatureModule = FeatureModuleType()
public let CoreModule = CoreModuleType()
public let ThirdPartyLibModule = ThirdPartyLibType()
public let WatchThirdPartyLibModule = WatchThirdPartyLibType()
