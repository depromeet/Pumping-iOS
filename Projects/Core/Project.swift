//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/22.
//

import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let targets: [Target] = [
    .core(
        factory: .init(
            dependencies: [
                .core(implements: .Network),
                .core(implements: .KeyChainStore),
                .core(implements: .HealthKitManager),
                .shared
            ]
        )
    )
]


let project: Project = .makeModule(
    name: "Core",
    targets: targets
)
