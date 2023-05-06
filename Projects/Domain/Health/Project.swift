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
        implements: .Health,
        factory: .init(
            dependencies: [
                .domain(interface: .Health)
            ]
        )
    ),
    .domain(
        tests: .Health,
        factory: .init(
            dependencies: [
                .domain(testing: .Health)
            ]
        )
    ),
    .domain(
        testing: .Health,
        factory: .init(
            dependencies: [
                .domain(interface: .Health)
            ]
        )
    ),
    .domain(
        interface: .Health,
        factory: .init()
    )
]

let project: Project = .makeModule(
    name: "DomainHealth",
    targets: targets
)
