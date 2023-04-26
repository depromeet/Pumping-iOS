//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/24.
//

import ProjectDescription
import DependencyPlugin

let targets: [Target] = [
    FeatureModule.target(
        target: .Health,
        micro: .Source,
        dependencies: [
            FeatureModule.targetDependency(target: .Health, micro: .Interface),
            CoreModule.targetDependency(),
        ]
    ),
    FeatureModule.target(
        target: .Health,
        micro: .Tests,
        dependencies: [
            FeatureModule.targetDependency(target: .Health, micro: .Interface),
            FeatureModule.targetDependency(target: .Health, micro: .Testing),
        ]
    ),
    FeatureModule.target(
        target: .Health,
        micro: .Testing,
        dependencies: [
            FeatureModule.targetDependency(target: .Health, micro: .Interface),
        ]
    ),
    FeatureModule.target(
        target: .Health,
        micro: .Interface
    ),
]

let project: Project = .init(
    name: FeatureModule.name(target: .Health),
    targets: targets
)
