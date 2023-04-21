//
//  GeneratedModules.swift
//  DependencyPlugin
//
//  Created by 송영모 on 2023/04/21.
//

import Foundation

public protocol ModuleProtocol: CaseIterable {
    var projectName: String { get }
    var targetName: String { get }
}

public enum ApplicationModule: String, ModuleProtocol {
    case iOS = "iOS"
    case watchOS = "WatchOS"
    
    public var projectName: String { "Application" }
    public var targetName: String { "\(projectName)\(self.rawValue)" }
}

public enum FeatureModule: String, ModuleProtocol {
    case health = "Health"
    case map = "Map"
    
    public var projectName: String { "Feature" }
    public var targetName: String { "\(projectName)\(self.rawValue)" }
}

public enum CoreModule: String, ModuleProtocol {
    case health = "Health"
    case map = "Map"
    
    public var projectName: String { "Core" }
    public var targetName: String { "\(projectName)\(self.rawValue)" }
}
