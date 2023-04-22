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
        sources: "Sources/**",
        dependencies: [
            .project(target: "NetworkInterface", path: .relativeToCurrentFile("Interface")),
            .project(target: "NetworkTesting", path: .relativeToCurrentFile("Testing")),
            .project(target: "NetworkTests", path: .relativeToCurrentFile("Tests"))
        ]
    ),
]

let project: Project = .init(
    name: "Network",
    targets: targets
)
