//
//  Project.swift
//  NetworkManifests
//
//  Created by 송영모 on 2023/04/22.
//

import ProjectDescription
import DependencyPlugin

let targets: [Target] = [
    .init(
        name: "NetworkInterface",
        platform: .iOS,
        product: .framework,
        bundleId: "com.core.network.networkInterface",
        infoPlist: .default,
        sources: "Sources/**",
        dependencies: [
            
        ]
    ),
]

let project: Project = .init(
    name: "NetworkInterface",
    targets: targets
)
