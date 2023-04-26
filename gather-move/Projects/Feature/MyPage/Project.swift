//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/26.
//

import ProjectDescription
import DependencyPlugin

let targets: [Target] = [
    FeatureModule.target(
        target: .MyPage,
        dependencies: [
            DomainModule.targetDependency(target: .Login),
            DomainModule.targetDependency(target: .Health)
        ]
    )
]

let project: Project = .init(
    name: FeatureModule.name(target: .MyPage),
    targets: targets
)
