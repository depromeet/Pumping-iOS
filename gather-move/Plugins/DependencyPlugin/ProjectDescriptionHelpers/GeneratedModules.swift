//
//  GeneratedModules.swift
//  DependencyPlugin
//
//  Created by 송영모 on 2023/04/21.
//

import Foundation

public protocol ModuleIdentifier: CaseIterable {
    var name: String { get }
}

// MARK: ApplicationModuleIdentifier

public struct ApplicationModuleIdentifier: ModuleIdentifier {
    public static var allCases: [ApplicationModuleIdentifier] = [
        Self.iOS,
        Self.WatchOS
    ]
    
    static let iOS: Self = .init(name: "iOS")
    static let WatchOS: Self = .init(name: "WatchOS")
    
    public let name: String
    
    public init(name: String) {
        self.name = name
    }
}

public enum FeatureModule: String {
    case Health
    case Map
}

public enum CoreModule: String {
    case Health
    case Map
}

public enum ThirdPartyLibModule: String {
    case ThirdPartyLib
}
