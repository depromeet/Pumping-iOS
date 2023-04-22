//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/21.
//

import ProjectDescription
import DependencyPlugin

let targets: [Target] = [
    ApplicationModuleIdentifier.iOS.target(dependencies: []),
    ApplicationModuleIdentifier.WatchOS.target(dependencies: [])
]

let project: Project = .init(
    name: ApplicationModuleIdentifier.id.project,
    organizationName: ApplicationModuleIdentifier.organizationName,
    targets: targets
)
