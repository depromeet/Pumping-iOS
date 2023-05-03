//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/24.
//

import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let targets: [Target] = [
    .feature(
        factory: .init(
            dependencies: [
                .domain,
                .feature(implements: .Onboarding),
                .feature(implements: .Home),
                .feature(implements: .MyPage)
            ]
        )
    )
]

let project: Project = .makeModule(
    name: "Feature",
    targets: targets
)
