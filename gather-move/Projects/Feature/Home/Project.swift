//
//  Project.swift
//  FeatureManifests
//
//  Created by 송영모 on 2023/04/27.
//

import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let targets: [Target] = [
    .feature(
        implements: .Home,
        factory: .init(
            dependencies: [
                .feature(interface: .Home),
                .feature(interface: .MyPage),
                .feature(interface: .Onboarding),
                .domain(implements: .Login),
                .domain(implements: .Health)
            ]
        )
    ),
    .feature(
        tests: .Home,
        factory: .init(
            dependencies: [
                .feature(testing: .Home)
            ]
        )
    ),
    .feature(
        testing: .Home,
        factory: .init(
            dependencies: [
                .feature(interface: .Home)
            ]
        )
    ),
    .feature(
        interface: .Home,
        factory: .init()
    )
]

let project: Project = .make(
    name: "FeatureHome",
    targets: targets
)
