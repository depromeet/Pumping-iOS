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
        name: "UtilityInterface",
        platform: .iOS,
        product: .framework,
        bundleId: "com.core.utility.utilityInterface",
        infoPlist: .default,
        sources: "Sources/**",
        dependencies: [
            
        ]
    ),
]

let project: Project = .init(
    name: "UtilityInterface",
    targets: targets
)
