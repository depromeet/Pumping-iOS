//
//  Workspace.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/03/06.
//

import ProjectDescription
import DependencyPlugin

let workspace = Workspace(
    name: "GatherMove",
    projects: {
        var projects: [Path] = []
        
        projects += ApplicationModule.allCases.map {
            Path("Projects/Application/\($0.rawValue)")
        }
        
        projects += FeatureModule.allCases.map {
            Path("Projects/Feature/\($0.rawValue)")
        }
        
        projects += CoreModule.allCases.map {
            Path("Projects/Core/\($0.rawValue)")
        }
        
        return projects
    }()
)
