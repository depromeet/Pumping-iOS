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
                .domain(implements: .Auth),
                .domain(implements: .Workout),
                .domain(implements: .Crew),
                .domain(implements: .WatchConnectivity),
                .domain(implements: .User),
                .core
            ]
        )
    )
]

let project: Project = .makeModule(
    name: "Domain",
    targets: targets
)
