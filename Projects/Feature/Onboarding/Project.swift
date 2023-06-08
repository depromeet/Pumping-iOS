//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/26.
//

import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let targets: [Target] = [
    .feature(
        implements: .Onboarding,
        factory: .init(
            dependencies: [
                .feature(interface: .Home),
                .feature(interface: .Profile),
                .feature(interface: .Onboarding)
            ]
        )
    ),
    .feature(
        tests: .Onboarding,
        factory: .init(
            dependencies: [
                .feature(testing: .Onboarding)
            ]
        )
    ),
    .feature(
        testing: .Onboarding,
        factory: .init(
            dependencies: [
                .feature(interface: .Onboarding)
            ]
        )
    ),
    .feature(
        interface: .Onboarding,
        factory: .init(
            dependencies: [
                .domain
            ]
        )
    )
]

let project: Project = .makeModule(
    name: "FeatureOnboarding",
    targets: targets
)
