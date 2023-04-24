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
        name: "Core",
        platform: .iOS,
        product: .framework,
        bundleId: "com.core",
        infoPlist: .default,
        sources: ["Sources/**"],
        dependencies: [
            .project(target: "Network", path: .relativeToCurrentFile("Network")),
            .project(target: "Utility", path: .relativeToCurrentFile("Utility")),
            .project(target: "ThirdPartyLib", path: .relativeToRoot("Projects/ThirdPartyLib"))
        ]
    )
]

let project: Project = .init(
    name: "Core",
    targets: targets
)
