//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/22.
//

import ProjectDescription
import DependencyPlugin

let targets: [Target] = [
    .init(
        name: ThirdPartyLibModule.ThirdPartyLib.rawValue,
        platform: .iOS,
        product: .framework,
        bundleId: <#T##String#>
        dependencies: [
            .package(product: "ComposableArchitecture"),
            .package(product: "RealmSwift")
        ]
    )
]

let project: Project = .init(
    name: Environment.appName,
    organizationName: Environment.organizationName,
    targets: targets
)

let factory: ProjectFactory = .init(
    project: .init(
        name: Module.utils.rawValue,
        packages: [
            .remote(url: "https://github.com/pointfreeco/swift-composable-architecture", requirement: .upToNextMajor(from: "0.51.0")),
            .remote(url: "https://github.com/realm/realm-swift.git", requirement: .upToNextMajor(from: "10.31.0"))
        ]
    ),
    targets: [
    ]
)

