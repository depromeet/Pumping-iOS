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
    .watchShared(
        implements: .DesignSystem,
        factory: .init(infoPlist: .extendingDefault(
            with: [
                "CFBundleShortVersionString": "1.0",
                "CFBundleVersion": "1"
            ]))
    )
]

let project: Project = .init(
    name: "WatchSharedDesignSystem",
    targets: targets
)
