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
        name: "Network",
        platform: .iOS,
        product: .framework,
        bundleId: "com.app.iOS",
        infoPlist: .default,
        sources: "Sources",
        dependencies: [
            
        ]
    ),
    .init(
        name: "Utility",
        platform: .iOS,
        product: .framework,
        bundleId: "com.core.utility",
        infoPlist: .default,
        sources: "Sources",
        dependencies: [
            
        ]
    )
]

let project: Project = .init(
    name: "Core",
    targets: targets
)
