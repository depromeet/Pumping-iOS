//
//  ModuleIdentifier+Application.swift
//  DependencyPlugin
//
//  Created by 송영모 on 2023/04/22.
//

import Foundation

// MARK: ApplicationModuleIdentifier

public class ApplicationModuleIdentifier: ModuleIdentifier {
    public static let projectName: String = "Application"
    
    public static let module: ApplicationModuleIdentifier = .init(
        project: ApplicationModuleIdentifier.projectName,
        targets: [
            TargetIdentifier(
                project: ApplicationModuleIdentifier.projectName,
                target: "iOS"
            ),
            TargetIdentifier(
                project: ApplicationModuleIdentifier.projectName,
                target: "WatchOS"
            )
    ])
}
