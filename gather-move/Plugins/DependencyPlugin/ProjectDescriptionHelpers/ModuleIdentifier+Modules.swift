//
//  ModuleIdentifier+Modules.swift
//  DependencyPlugin
//
//  Created by 송영모 on 2023/04/22.
//

import Foundation

// MARK: CoreModuleIdentifier

public class CoreModuleIdentifier: ModuleIdentifier {
    public static let id: CoreModuleIdentifier = .init(project: "Core", target: "")
    
    public static let Network: CoreModuleIdentifier = .init(project: id.project, target: "Network")
    public static let Model: CoreModuleIdentifier = .init(project: id.project, target: "Model")
}

// MARK: DomainModuleIdentifier

public class DomainModuleIdentifier: ModuleIdentifier {
    public static let id: DomainModuleIdentifier = .init(project: "Domain", target: "")
    
    public static let Health: DomainModuleIdentifier = .init(project: id.project, target: "Health")
    public static let Todo: DomainModuleIdentifier = .init(project: id.project, target: "Todo")
}

public enum ThirdPartyLibModule: String {
    case ThirdPartyLib
}
