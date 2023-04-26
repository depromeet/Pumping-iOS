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
        target: .DesignSystem,
        platform: .watchOS,
        resources: ["Resources/**"]
    )
]

let project: Project = .init(
    name: WatchSharedModule.name(target: .DesignSystem),
    targets: targets
)
