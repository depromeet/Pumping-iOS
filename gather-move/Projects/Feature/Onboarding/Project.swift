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
        target: .Onboarding,
        dependencies: [
            DomainModule.targetDependency(target: .Login),
            DomainModule.targetDependency(target: .Health)
        ]
    )
]

let project: Project = .init(
    name: FeatureModule.name(target: .Onboarding),
    targets: targets
)
