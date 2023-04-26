//
//  Project.swift
//  FeatureManifests
//
//  Created by 송영모 on 2023/04/27.
//

import ProjectDescription
import DependencyPlugin

let targets: [Target] = [
    FeatureModule.target(
        target: .Home,
        dependencies: [
            DomainModule.targetDependency(target: .Login),
            DomainModule.targetDependency(target: .Health)
        ]
    )
]

let project: Project = .init(
    name: FeatureModule.name(target: .Home),
    targets: targets
)
