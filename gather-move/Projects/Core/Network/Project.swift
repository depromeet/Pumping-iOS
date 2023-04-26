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
        name: "CoreNetwork",
        platform: .iOS,
        product: .framework,
        bundleId: "com.core.network",
        infoPlist: .default,
        sources: ["Sources/**"],
        dependencies: [
            .target(name: "CoreNetworkInterface"),
            .target(name: "CoreNetworkTesting"),
            .target(name: "CoreNetworkTests")
        ]
    ),
    .init(
        name: "CoreNetworkInterface",
        platform: .iOS,
        product: .staticFramework,
        bundleId: "com.core.network.interface",
        infoPlist: .default,
        sources: ["Interface/Sources/**"],
        dependencies: [
            
        ]
    ),
    .init(
        name: "CoreNetworkTesting",
        platform: .iOS,
        product: .staticFramework,
        bundleId: "com.core.network.testing",
        infoPlist: .default,
        sources: ["Testing/Sources/**"],
        dependencies: [
            
        ]
    ),
    .init(
        name: "CoreNetworkTests",
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
    name: "CoreNetwork",
    targets: targets
)
