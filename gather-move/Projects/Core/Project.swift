//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/22.
//

import Foundation

import ProjectDescription
import DependencyPlugin

let targets: [Target] = [
    CoreModuleIdentifier.id.target(),
    CoreModuleIdentifier.Network.target(dependencies: [
//        .interface(forIdentifier: CoreModuleIdentifier.id),
    ]),
    CoreModuleIdentifier.Model.target(dependencies: [
        
    ])
]

let project: Project = .init(
    name: CoreModuleIdentifier.id.project,
    organizationName: CoreModuleIdentifier.organizationName,
    targets: targets
)
