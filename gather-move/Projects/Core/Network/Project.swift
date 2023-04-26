//
//  Project.swift
//  CoreManifests
//
//  Created by 송영모 on 2023/04/22.
//

import ProjectDescription
import DependencyPlugin

let targets: [Target] = [
    CoreModule.target(
        target: .Network,
        micro: .Source,
        dependencies: [
            CoreModule.targetDependency(target: .Network, micro: .Interface),
        ]
    ),
    CoreModule.target(
        target: .Network,
        micro: .Tests,
        dependencies: [
            CoreModule.targetDependency(target: .Network, micro: .Interface),
            CoreModule.targetDependency(target: .Network, micro: .Testing),
        ]
    ),
    CoreModule.target(
        target: .Network,
        micro: .Testing,
        dependencies: [
            CoreModule.targetDependency(target: .Network, micro: .Interface),
        ]
    ),
    CoreModule.target(
        target: .Network,
        micro: .Interface
    ),
]

let project: Project = .init(
    name: CoreModule.name(),
    targets: targets
)
