//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/24.
//

import ProjectDescription
import DependencyPlugin

let targets: [Target] = [
    WatchThirdPartyLibModule.target(
        platform: .watchOS,
        dependencies: [
            .external(name: "ComposableArchitecture")
        ]
    )
]

let project: Project = .init(
    name: WatchThirdPartyLibModule.name(),
    targets: targets
)
