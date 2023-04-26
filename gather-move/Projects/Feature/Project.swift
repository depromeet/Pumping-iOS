//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/24.
//

import ProjectDescription
import DependencyPlugin

let targets: [Target] = [
    .init(
        name: FeatureModule.name(),
        platform: .iOS,
        product: .framework,
        bundleId: FeatureModule.bundleId(),
        infoPlist: .default,
        sources: ["Sources/**"],
        dependencies: [
            FeatureModule.targetDependency(target: .Login),
            FeatureModule.targetDependency(target: .Home),
            FeatureModule.targetDependency(target: .Health),
        ]
    )
]

let project: Project = .init(
    name: FeatureModule.name(),
    targets: targets
)
