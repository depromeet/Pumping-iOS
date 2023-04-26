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
        name: "Domain",
        platform: .iOS,
        product: .framework,
        bundleId: "com.domain",
        infoPlist: .default,
        sources: ["Sources/**"],
        dependencies: [
            
        ]
    )
]

let project: Project = .init(
    name: "Domain",
    targets: targets
)
