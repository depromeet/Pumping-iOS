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
        name: "FeatureHealth",
        platform: .iOS,
        product: .framework,
        bundleId: "com.feature.health",
        infoPlist: .default,
        sources: ["Sources/**"],
        dependencies: [
            .target(name: "FeatureHealthInterface"),
            .target(name: "FeatureHealthTesting"),
            .target(name: "FeatureHealthTests"),
            .project(target: "Core", path: .relativeToRoot("Projects/Core"))
        ]
    ),
    .init(
        name: "FeatureHealthInterface",
        platform: .iOS,
        product: .staticFramework,
        bundleId: "com.feature.health.interface",
        infoPlist: .default,
        sources: ["Interface/Sources/**"],
        dependencies: [
            
        ]
    ),
    .init(
        name: "FeatureHealthTesting",
        platform: .iOS,
        product: .staticFramework,
        bundleId: "com.feature.health.testing",
        infoPlist: .default,
        sources: ["Testing/Sources/**"],
        dependencies: [
            
        ]
    ),
    .init(
        name: "FeatureHealthTests",
        platform: .iOS,
        product: .staticFramework,
        bundleId: "com.feature.health.tests",
        infoPlist: .default,
        sources: ["Tests/Sources/**"],
        dependencies: [
            
        ]
    ),
]

let project: Project = .init(
    name: "FeatureHealth",
    targets: targets
)
