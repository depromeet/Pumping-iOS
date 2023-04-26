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
        target: .Health,
        micro: .Source,
        dependencies: [
            DomainModule.targetDependency(target: .Health, micro: .Interface),
            CoreModule.targetDependency(),
        ]
    ),
    DomainModule.target(
        target: .Health,
        micro: .Tests,
        dependencies: [
            DomainModule.targetDependency(target: .Health, micro: .Interface),
            DomainModule.targetDependency(target: .Health, micro: .Testing),
        ]
    ),
    DomainModule.target(
        target: .Health,
        micro: .Testing,
        dependencies: [
            DomainModule.targetDependency(target: .Health, micro: .Interface),
        ]
    ),
    DomainModule.target(
        target: .Health,
        micro: .Interface
    ),
]

let project: Project = .init(
    name: DomainModule.name(target: .Health),
    targets: targets
)
