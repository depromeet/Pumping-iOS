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
        target: .Login,
        micro: .Source,
        dependencies: [
            DomainModule.targetDependency(target: .Login, micro: .Interface),
            CoreModule.targetDependency(),
        ]
    ),
    DomainModule.target(
        target: .Login,
        micro: .Tests,
        dependencies: [
            DomainModule.targetDependency(target: .Login, micro: .Interface),
            DomainModule.targetDependency(target: .Login, micro: .Testing),
        ]
    ),
    DomainModule.target(
        target: .Login,
        micro: .Testing,
        dependencies: [
            DomainModule.targetDependency(target: .Login, micro: .Interface),
        ]
    ),
    DomainModule.target(
        target: .Login,
        micro: .Interface
    ),
]

let project: Project = .init(
    name: DomainModule.name(target: .Login),
    targets: targets
)
