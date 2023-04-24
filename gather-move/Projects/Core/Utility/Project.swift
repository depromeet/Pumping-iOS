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
        sources: ["Sources/**"],
        dependencies: [
            .target(name: "UtilityInterface")
        ]
    ),
    .init(
        name: "UtilityInterface",
        platform: .iOS,
        product: .staticFramework,
        bundleId: "com.core.utility.interface",
        infoPlist: .default,
        sources: ["Interface/Sources/**"],
        dependencies: [
            
        ]
    )
]

let project: Project = .init(
    name: "Utility",
    targets: targets
)
