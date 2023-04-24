//
//  Project.swift
//  CoreManifests
//
//  Created by 송영모 on 2023/04/22.
//

import ProjectDescription
import DependencyPlugin

let targets: [Target] = [
    .init(
        name: "Network",
        platform: .iOS,
        product: .framework,
        bundleId: "com.core.network",
        infoPlist: .default,
        sources: ["Sources/**"],
        dependencies: [
            .target(name: "NetworkInterface"),
            .target(name: "NetworkTesting"),
            .target(name: "NetworkTests")
        ]
    ),
    .init(
        name: "NetworkInterface",
        platform: .iOS,
        product: .staticFramework,
        bundleId: "com.core.network.interface",
        infoPlist: .default,
        sources: ["Interface/Sources/**"],
        dependencies: [
            
        ]
    ),
    .init(
        name: "NetworkTesting",
        platform: .iOS,
        product: .staticFramework,
        bundleId: "com.core.network.testing",
        infoPlist: .default,
        sources: ["Testing/Sources/**"],
        dependencies: [
            
        ]
    ),
    .init(
        name: "NetworkTests",
        platform: .iOS,
        product: .staticFramework,
        bundleId: "com.core.network.tests",
        infoPlist: .default,
        sources: ["Tests/Sources/**"],
        dependencies: [
            
        ]
    ),
]

let project: Project = .init(
    name: "Network",
    targets: targets
)
