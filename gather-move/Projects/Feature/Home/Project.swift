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
        target: .Home,
        micro: .Source,
        dependencies: [
            FeatureModule.targetDependency(target: .Home, micro: .Interface),
        ]
    ),
    FeatureModule.target(
        target: .Home,
        micro: .Tests,
        dependencies: [
            FeatureModule.targetDependency(target: .Home, micro: .Interface),
            FeatureModule.targetDependency(target: .Home, micro: .Testing),
        ]
    ),
    FeatureModule.target(
        target: .Home,
        micro: .Testing,
        dependencies: [
            FeatureModule.targetDependency(target: .Home, micro: .Interface),
        ]
    ),
    FeatureModule.target(
        target: .Home,
        micro: .Interface
    ),
]

let project: Project = .init(
    name: FeatureModule.name(target: .Home),
    targets: targets
)
