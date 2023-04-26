//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/27.
//

import ProjectDescription
import DependencyPlugin

let targets: [Target] = [
    SharedModule.target(
        target: .ThirdPartyLib,
        dependencies: [
            .external(name: "ComposableArchitecture")
        ]
    )
]

let project: Project = .init(
    name: SharedModule.name(target: .ThirdPartyLib),
    targets: targets
)
