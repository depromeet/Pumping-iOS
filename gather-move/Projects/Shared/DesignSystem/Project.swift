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
        target: .DesignSystem,
        resources: ["Resources/**"],
        dependencies: [
            
        ]
    )
]

let project: Project = .init(
    name: SharedModule.name(target: .DesignSystem),
    targets: targets
)
