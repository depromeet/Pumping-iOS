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
        name: "NetworkTests",
        platform: .iOS,
        product: .staticFramework,
        bundleId: "com.core.network.networkTests",
        infoPlist: .default,
        sources: "Sources/**",
        dependencies: [
            
        ]
    ),
]

let project: Project = .init(
    name: "NetworkTests",
    targets: targets
)
