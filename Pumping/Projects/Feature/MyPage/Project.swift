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
        implements: .MyPage,
        factory: .init(
            dependencies: [
                .feature(interface: .Home),
                .feature(interface: .MyPage),
                .feature(interface: .Onboarding),
                .domain
            ]
        )
    ),
    .feature(
        tests: .MyPage,
        factory: .init(
            dependencies: [
                .feature(testing: .MyPage)
            ]
        )
    ),
    .feature(
        testing: .MyPage,
        factory: .init(
            dependencies: [
                .feature(interface: .MyPage)
            ]
        )
    ),
    .feature(
        interface: .MyPage,
        factory: .init()
    )
]

let project: Project = .make(
    name: "FeatureMyPage",
    targets: targets
)
