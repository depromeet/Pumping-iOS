//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/07/05.
//

import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePath.WatchShared.name+ModulePath.WatchShared.Util.rawValue,
    targets: [
        .watchShared(
            implements: .Util,
            factory: .init()
        ),
    ]
)
