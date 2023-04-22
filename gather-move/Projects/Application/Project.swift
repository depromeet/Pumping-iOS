//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/21.
//

import ProjectDescription
import DependencyPlugin

let id = ApplicationModuleIdentifier.self

let project: Project = .init(
    name: id.module.project,
    organizationName: id.organizationName,
    targets: id.module.targets.map { $0.make() }
)
