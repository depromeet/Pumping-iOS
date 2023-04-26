//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/26.
//

import ProjectDescription
import DependencyPlugin

let targets: [Target] = [
    FeatureModule.target(
        target: .Login,
        micro: .Source,
        dependencies: [
            FeatureModule.targetDependency(target: .Login, micro: .Interface),
            CoreModule.targetDependency(),
        ]
    ),
    FeatureModule.target(
        target: .Login,
        micro: .Tests,
        dependencies: [
            FeatureModule.targetDependency(target: .Login, micro: .Interface),
            FeatureModule.targetDependency(target: .Login, micro: .Testing),
        ]
    ),
    FeatureModule.target(
        target: .Login,
        micro: .Testing,
        dependencies: [
            FeatureModule.targetDependency(target: .Login, micro: .Interface),
        ]
    ),
    FeatureModule.target(
        target: .Login,
        micro: .Interface
    ),
]

let project: Project = .init(
    name: FeatureModule.name(target: .Login),
    targets: targets
)
