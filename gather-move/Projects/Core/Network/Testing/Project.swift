//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/22.
//

import ProjectDescription
import DependencyPlugin

let targets: [Target] = [
    .init(
        name: "NetworkTesting",
        platform: .iOS,
        product: .staticLibrary,
        bundleId: "com.core.network.networkTesting",
        infoPlist: .default,
        sources: "Sources/**",
        dependencies: [
            
        ]
    ),
]

let project: Project = .init(
    name: "NetworkTesting",
    targets: targets
)
