//
//  TargetDependency+Modules.swift
//  DependecnyPlugin
//
//  Created by 송영모 on 2023/04/21.
//

import ProjectDescription
import Foundation

extension TargetDependency {
    public static func interface(forIdentifier identifier: ModuleIdentifierType) -> TargetDependency {
        return .project(target: identifier.target, path: .relativeToRoot("Projects/\(identifier.project)/\(identifier.target)"))
    }
}
