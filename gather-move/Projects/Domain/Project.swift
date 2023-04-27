//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/26.
//

import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let targets: [Target] = [
    .domain(
        factory: .init(
            dependencies: [
                .domain(implements: .Health),
                .domain(implements: .Login)
            ]
        )
    )
]

let project: Project = .make(
    name: "Domain",
    targets: targets
)
