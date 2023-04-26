//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/26.
//

import ProjectDescription
import DependencyPlugin

let targets: [Target] = [
    DomainModule.target(
        dependencies: [
            DomainModule.targetDependency(target: .Health),
            DomainModule.targetDependency(target: .Login)
        ]
    ),
]

let project: Project = .init(
    name: DomainModule.name(),
    targets: targets
)
