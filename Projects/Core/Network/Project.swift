//
//  Project.swift
//  CoreManifests
//
//  Created by 송영모 on 2023/04/22.
//

import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let targets: [Target] = [
    .core(
        interface: .Network,
        factory: .init(
            dependencies: [
                .shared
            ]
        )
    ),
    .core(
        implements: .Network,
        factory: .init(
            dependencies: [
                .core(interface: .Network)
            ]
        )
    ),
    .core(
        tests: .Network,
        factory: .init(
            dependencies: [
                .core(testing: .Network)
            ]
        )
    ),
    .core(
        testing: .Network,
        factory: .init(
            dependencies: [
                .core(interface: .Network)
            ]
        )
    ),
    
]
let project: Project = .makeModule(
    name: "CoreNetwork",
    targets: targets
)
