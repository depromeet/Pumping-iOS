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
        implements: .DesignSystem,
        factory: .init(
            dependencies: [
                .external(name: "ComposableArchitecture"),
                .external(name: "Lottie")
            ]
        )
    )
]

let project: Project = .init(
    name: "SharedDesignSystem",
    targets: targets,
    resourceSynthesizers: [
        .assets(),
        .fonts(),
        .custom(name: "JSON", parser: .json, extensions: ["json"])
    ]
)
