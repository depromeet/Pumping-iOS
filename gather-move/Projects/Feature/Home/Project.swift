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
        name: "FeatureHome",
        platform: .iOS,
        product: .framework,
        bundleId: "com.feature.home",
        infoPlist: .default,
        sources: ["Sources/**"],
        dependencies: [
            .target(name: "FeatureHomeInterface"),
            .target(name: "FeatureHomeTesting"),
            .target(name: "FeatureHomeTests"),
            .project(target: "Core", path: .relativeToRoot("Projects/Core"))
        ]
    ),
    .init(
        name: "FeatureHomeInterface",
        platform: .iOS,
        product: .staticFramework,
        bundleId: "com.feature.home.interface",
        infoPlist: .default,
        sources: ["Interface/Sources/**"],
        dependencies: [
            
        ]
    ),
    .init(
        name: "FeatureHomeTesting",
        platform: .iOS,
        product: .staticFramework,
        bundleId: "com.feature.home.testing",
        infoPlist: .default,
        sources: ["Testing/Sources/**"],
        dependencies: [
            
        ]
    ),
    .init(
        name: "FeatureHomeTests",
        platform: .iOS,
        product: .staticFramework,
        bundleId: "com.feature.home.tests",
        infoPlist: .default,
        sources: ["Tests/Sources/**"],
        dependencies: [
            
        ]
    ),
]

let project: Project = .init(
    name: "FeatureHome",
    targets: targets
)
