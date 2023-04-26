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
        resources: ResourceFileElements?,
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
        resources: ResourceFileElements? = nil,
        dependencies: [TargetDependency] = []
    ) -> Target {
        let name: String = self.name(target: target, micro: micro)
        let product: Product
        let sources: SourceFilesList
        let bundleId: String = self.bundleId(target: target, micro: micro)

        switch micro {
        case .Source:
            if resources == nil {
                product = .framework
            } else {
                product = .staticFramework
            }
            
            sources = ["Sources/**"]
            
        case .Interface:
            product = .framework
            sources = ["\(micro.rawValue)/Sources/**"]
            
        case .Tests:
            product = .unitTests
            sources = ["\(micro.rawValue)/Sources/**"]
            
        default:
            if resources == nil {
                product = .staticLibrary
            } else {
                product = .staticFramework
            }
            sources = ["\(micro.rawValue)/Sources/**"]
        }
            
        return .init(
            name: name,
            platform: platform,
            product: product,
            bundleId: bundleId,
            sources: sources,
            resources: resources,
            dependencies: dependencies
        )
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
        case Health
        case Login
    }
}

// MARK: FeatureModuleType

public class FeatureModuleType: ModuleType {
    public let moduleName: String = "Feature"
    
    public enum TargetType: String {
        case Onboarding
        case Home
        case MyPage
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

// MARK: SharedModuleType

public class SharedModuleType: ModuleType {
    public let moduleName: String = "Shared"
    
    public enum TargetType: String {
        case DesignSystem
        case ThirdPartyLib
    }
}

// MARK: WatchSharedModuleType

public class WatchSharedModuleType: ModuleType {
    public let moduleName: String = "WatchShared"
    
    public enum TargetType: String {
        case DesignSystem
        case ThirdPartyLib
    }
}

public let AppModule = AppModuleType()
public let DomainModule = DomainModuleType()
public let FeatureModule = FeatureModuleType()
public let CoreModule = CoreModuleType()
public let SharedModule = SharedModuleType()
public let WatchSharedModule = WatchSharedModuleType()
