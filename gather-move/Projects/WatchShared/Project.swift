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
        platform: .watchOS,
        dependencies: [
            WatchSharedModule.targetDependency(target: .DesignSystem),
            WatchSharedModule.targetDependency(target: .ThirdPartyLib)
        ]
    )
]

let project: Project = .init(
    name: WatchSharedModule.name(),
    targets: targets
)
