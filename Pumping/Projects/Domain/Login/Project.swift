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
        implements: .Login,
        factory: .init(
            dependencies: [
                .domain(interface: .Login),
                .domain(interface: .Health)
            ]
        )
    ),
    .domain(
        tests: .Login,
        factory: .init(
            dependencies: [
                .domain(testing: .Login)
            ]
        )
    ),
    .domain(
        testing: .Login,
        factory: .init(
            dependencies: [
                .domain(interface: .Login)
            ]
        )
    ),
    .domain(
        interface: .Login,
        factory: .init()
    )
]

let project: Project = .makeModule(
    name: "DomainLogin",
    targets: targets
)
