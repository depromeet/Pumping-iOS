//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/24.
//

import ProjectDescription
import DependencyPlugin

let targets: [Target] = [
    FeatureModule.target(
        dependencies: [
            FeatureModule.targetDependency(target: .Home),
            FeatureModule.targetDependency(target: .MyPage),
            FeatureModule.targetDependency(target: .Onboarding),
            CoreModule.targetDependency(),
        ])
]

let project: Project = .init(
    name: FeatureModule.name(),
    targets: targets
)
