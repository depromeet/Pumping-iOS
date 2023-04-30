//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/21.
//

import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin


let targets: [Target] = [
    .app(
        implements: .IOS,
        factory: .init(
            dependencies: [
                .app(implements: .Watch),
                .feature
            ]
        )
    ),
    .app(
        implements: .Watch,
        factory: .init(
            dependencies: [
                .app(implements: .WatchExtension)
            ]
        )
    ),
    .app(
        implements: .WatchExtension,
        factory: .init(
            dependencies: [
                .watchShared
            ]
        )
    )
]

let project: Project = .init(
    name: "Pumping",
    targets: targets
)
