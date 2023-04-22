//
//  ModuleIdentifier+Application.swift
//  DependencyPlugin
//
//  Created by 송영모 on 2023/04/22.
//

import Foundation

// MARK: ApplicationModuleIdentifier

public class ApplicationModuleIdentifier: ModuleIdentifier {
    public static let id: ApplicationModuleIdentifier = .init(project: "Application", target: "")
    
    public static let iOS: ApplicationModuleIdentifier = .init(project: id.project, target: "iOS")
    public static let WatchOS: ApplicationModuleIdentifier = .init(project: id.project, target: "WatchOS")
    
    
}
