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
        target: .Onboarding,
        dependencies: [
            FeatureModule.targetDependency(target: .Login),
            FeatureModule.targetDependency(target: .Health)
        ]
    )
]

let project: Project = .init(
    name: DomainModule.name(target: .Onboarding),
    targets: targets
)
