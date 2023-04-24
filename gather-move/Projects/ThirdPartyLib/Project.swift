//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/24.
//

import ProjectDescription
import DependencyPlugin

let targets: [Target] = [
    .init(
        name: "ThirdPartyLib",
        platform: .iOS,
        product: .framework,
        bundleId: "com.thirdPartyLib",
        infoPlist: .default,
        dependencies: [
            .external(name: "ComposableArchitecture")
        ]
    )
]

let project: Project = .init(
    name: "ThirdPartyLib",
    targets: targets
)
