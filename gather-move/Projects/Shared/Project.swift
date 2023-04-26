//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/27.
//

import ProjectDescription
import DependencyPlugin

let targets: [Target] = [
    SharedModule.target(
        dependencies: [
            SharedModule.targetDependency(target: .DesignSystem),
            SharedModule.targetDependency(target: .ThirdPartyLib)
        ]
    )
]

let project: Project = .init(
    name: SharedModule.name(),
    targets: targets
)
