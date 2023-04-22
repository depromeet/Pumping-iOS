//
//  GeneratedModules.swift
//  DependencyPlugin
//
//  Created by 송영모 on 2023/04/21.
//

import Foundation
import ProjectDescription

public protocol ModuleIdentifierType {
    var project: String { get }
    var target: String { get }
    
    func project(
        name: String,
        organizationName: String?,
        options: Project.Options,
        packages: [Package],
        settings: Settings?,
        targets: [Target],
        schemes: [Scheme],
        fileHeaderTemplate: FileHeaderTemplate?,
        additionalFiles: [FileElement],
        resourceSynthesizers: [ResourceSynthesizer]
    ) -> Project
    
    func target(
        name: String?,
        platform: Platform,
        product: Product,
        productName: String?,
        bundleId: String?,
        deploymentTarget: DeploymentTarget,
        infoPlist: InfoPlist?,
        sources: SourceFilesList?,
        resources: ResourceFileElements?,
        copyFiles: [CopyFilesAction],
        headers: Headers?,
        entitlements: Path?,
        scripts: [TargetScript],
        dependencies: [TargetDependency],
        settings: Settings?,
        coreDataModels: [CoreDataModel],
        environment: [String : String],
        launchArguments: [LaunchArgument],
        additionalFiles: [FileElement]) -> Target
}

public class ModuleIdentifier: ModuleIdentifierType {
    public static let appName = "GatherMove"
    public static let organizationName = "com.82team.gathermove"
    
    public var project: String
    public var target: String
    
    public init(project: String, target: String) {
        self.project = project
        self.target = target
    }
    
    public func project(
        name: String,
        organizationName: String? = "com.82team.gathermove",
        options: Project.Options = .options(),
        packages: [Package] = [],
        settings: Settings? = .settings(),
        targets: [Target] = [],
        schemes: [Scheme] = [],
        fileHeaderTemplate: FileHeaderTemplate? = nil,
        additionalFiles: [FileElement] = [],
        resourceSynthesizers: [ResourceSynthesizer] = []
    ) -> Project {
            return .init(
                name: name,
                organizationName: organizationName,
                options: options,
                packages: packages,
                settings: settings,
                targets: targets,
                schemes: schemes,
                fileHeaderTemplate: fileHeaderTemplate,
                additionalFiles: additionalFiles,
                resourceSynthesizers: resourceSynthesizers
            )
        }
    
    public func target(
        name: String? = nil,
        platform: Platform = .iOS,
        product: Product = .framework,
        productName: String? = nil,
        bundleId: String? = nil,
        deploymentTarget: DeploymentTarget = .iOS(targetVersion: "16.0", devices: [.iphone]),
        infoPlist: InfoPlist? = .default,
        sources: SourceFilesList? = nil,
        resources: ResourceFileElements? = nil,
        copyFiles: [CopyFilesAction] = [],
        headers: Headers? = nil,
        entitlements: Path? = nil,
        scripts: [TargetScript] = [],
        dependencies: [TargetDependency] = [],
        settings: Settings? = .settings(),
        coreDataModels: [CoreDataModel] = [],
        environment: [String : String] = [:],
        launchArguments: [LaunchArgument] = [],
        additionalFiles: [FileElement] = []) -> Target {
            let name: String = name ?? String(describing: "\(self.target)\(self.project)")
            let bundleId: String = bundleId ?? String(describing: "com.\(self.project.lowercased()).\(self.target.lowercased())")
            let sources: SourceFilesList? = sources ?? (platform == .iOS ? ["\(self.target)\(self.target.isEmpty ? "" : "/")Sources/**"] : [])
            
            return .init(
                name: name,
                platform: platform,
                product: product,
                productName: productName,
                bundleId: bundleId,
                deploymentTarget: deploymentTarget,
                infoPlist: infoPlist,
                sources: sources,
                resources: resources,
                copyFiles: copyFiles,
                headers: headers,
                entitlements: entitlements,
                scripts: scripts,
                dependencies: dependencies,
                settings: settings,
                coreDataModels: coreDataModels,
                environment: environment,
                launchArguments: launchArguments,
                additionalFiles: additionalFiles
            )
        }
}
