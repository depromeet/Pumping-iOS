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
    func targetDependency(target: TargetType?, micro: MicroModuleType) -> TargetDependency
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
    
    public func bundleId(target: TargetType?, micro: MicroModuleType = .Source) -> String {
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
    
    // TODO: TargetDependency의 Extension으로 이동
    public func targetDependency(target: TargetType? = nil, micro: MicroModuleType = .Source) -> TargetDependency {
        guard let target = target else {
            return .project(
                target: self.name(target: target, micro: micro),
                path: self.path(target: target, micro: micro)
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

public class AppModuleType: ModuleType {
    public let moduleName: String = "App"
    
    public enum TargetType: String {
        case IOS
        case Watch
        case WatchExtension
    }
}

public class FeatureModuleType: ModuleType {
    public let moduleName: String = "Feature"
    
    public enum TargetType: String {
        case Home
        case Health
        case Login
    }
}

public let AppModule = AppModuleType()
public let FeatureModule = FeatureModuleType()
