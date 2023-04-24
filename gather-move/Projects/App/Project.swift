//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/21.
//

import ProjectDescription
import DependencyPlugin


let targets: [Target] = [
    .init(
        name: "iOSApp",
        platform: .iOS,
        product: .app,
        bundleId: "com.82team.gathermove",
        infoPlist: .default,
        sources: "Sources/**",
        dependencies: [
            .target(name: "WatchApp"),
            .project(target: "Feature", path: .relativeToRoot("Projects/Feature"))
        ]
    ),
    .init(
        name: "WatchApp",
        platform: .watchOS,
        product: .watch2App,
        bundleId: "com.82team.gathermove",
        infoPlist: .default,
        dependencies: [
            .target(name: "WatchExtension"),
        ]
    ),
    .init(
        name: "WatchExtension",
        platform: .watchOS,
        product: .watch2Extension,
        bundleId: "com.82team.gathermove",
        infoPlist: .default,
        sources: ["WatchExtension/Sources/**"],
        dependencies: [
            .project(target: "WatchThirdPartyLib", path: .relativeToRoot("Projects/WatchThirdPartyLib"))
        ]
    )
]

let project: Project = .init(
    name: "App",
    targets: targets
)
