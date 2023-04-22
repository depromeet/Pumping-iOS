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
        name: "Utility",
        platform: .iOS,
        product: .framework,
        bundleId: "com.core.utility",
        infoPlist: .default,
        sources: "Sources/**",
        dependencies: [
            .project(target: "UtilityInterface", path: .relativeToCurrentFile("Interface")),
        ]
    ),
]

let project: Project = .init(
    name: "Utility",
    targets: targets
)
