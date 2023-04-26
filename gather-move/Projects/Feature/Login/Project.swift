//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/26.
//

import ProjectDescription
import DependencyPlugin

let targets: [Target] = [
    .init(
        name: "FeatureLogin",
        platform: .iOS,
        product: .framework,
        bundleId: "com.feature.login",
        infoPlist: .default,
        sources: ["Sources/**"],
        dependencies: [
            .target(name: "FeatureLoginInterface"),
            .project(target: "Core", path: .relativeToRoot("Projects/Core"))
        ]
    ),
    .init(
        name: "FeatureLoginTests",
        platform: .iOS,
        product: .unitTests,
        bundleId: "com.feature.login.tests",
        infoPlist: .default,
        sources: ["Tests/Sources/**"],
        dependencies: [
            .target(name: "FeatureLogin"),
            .target(name: "FeatureLoginTesting"),
        ]
    ),
    .init(
        name: "FeatureLoginTesting",
        platform: .iOS,
        product: .staticFramework,
        bundleId: "com.feature.login.testing",
        infoPlist: .default,
        sources: ["Testing/Sources/**"],
        dependencies: [
            .target(name: "FeatureLoginInterface"),
        ]
    ),
    .init(
        name: "FeatureLoginInterface",
        platform: .iOS,
        product: .framework,
        bundleId: "com.feature.login.interface",
        infoPlist: .default,
        sources: ["Interface/Sources/**"],
        dependencies: [
            
        ]
    ),
]

let project: Project = .init(
    name: "FeatureLogin",
    targets: targets
)

