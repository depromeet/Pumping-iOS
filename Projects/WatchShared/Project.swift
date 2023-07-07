//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/27.
//

import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let targets: [Target] = [
    .watchShared(
        factory: .init(
            dependencies: [
                .watchShared(implements: .Util),
                .watchShared(implements: .DesignSystem),
                .watchShared(implements: .ThirdPartyLib)
            ]
        )
    )
]

let project: Project = .makeModule(
    name: "WatchShared",
    targets: targets
)
