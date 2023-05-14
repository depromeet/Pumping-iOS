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
    .shared(
        factory: .init(
            dependencies: [
                .shared(implements: .DesignSystem),
                .shared(implements: .ThirdPartyLib),
                .shared(implements: .Util)
            ]
        )
    )
]

let project: Project = .makeModule(
    name: "Shared",
    targets: targets
)
