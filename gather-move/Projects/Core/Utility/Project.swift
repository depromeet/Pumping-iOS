//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/22.
//

import ProjectDescription
import DependencyPlugin

let targets: [Target] = [
    CoreModule.target(
        target: .Utility,
        micro: .Source,
        dependencies: [
            ThirdPartyLibModule.targetDependency()
        ]
    )
]

let project: Project = .init(
    name: CoreModule.name(target: .Utility),
    targets: targets
)
