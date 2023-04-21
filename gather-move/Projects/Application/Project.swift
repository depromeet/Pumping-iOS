//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/21.
//

import ProjectDescription
import DependecnyPlugin

let targets: [Target] = [
    .init(
        name: "iOSApplication",
        platform: .iOS,
        product: .app,
        bundleId: "com.application.ios",
        infoPlist: .default,
        sources: "Sources",
        dependencies: []
    ),
    .init(
        name: "WatchApplication",
        platform: .iOS,
        product: .watch2App,
        bundleId: "com.application.watch",
        infoPlist: .default,
        sources: "Sources",
    )
]

let project: Project = .init(
    name: Environment.appName,
    organizationName: Environment.organizationName,
    targets: targets
)
