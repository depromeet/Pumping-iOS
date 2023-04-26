//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/27.
//

import ProjectDescription
import DependencyPlugin

let targets: [Target] = [
    WatchSharedModule.target(
        target: .ThirdPartyLib,
        platform: .watchOS,
        dependencies: [
            .external(name: "ComposableArchitecture")
        ]
    )
]

let project: Project = .init(
    name: WatchSharedModule.name(target: .ThirdPartyLib),
    targets: targets
)
