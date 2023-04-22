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
        product: .framework,
        bundleId: "com.app.iOS",
        infoPlist: .default,
        sources: "Sources",
        dependencies: [
            
        ]
    ),
    .init(
        name: "WatchOSApp",
        platform: .watchOS,
        product: .watch2App,
        bundleId: "com.app.watchOS",
        infoPlist: .default,
        dependencies: [
            
        ]
    )
]

let project: Project = .init(
    name: "App",
    targets: targets
)
