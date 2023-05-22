//
//  Target+Templates.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/27.
//

import ProjectDescription
import DependencyPlugin

// MARK: Target + Template

public struct TargetFactory {
    var name: String
    var platform: Platform
    var product: Product
    var productName: String?
    var bundleId: String?
    var deploymentTarget: DeploymentTarget?
    var infoPlist: InfoPlist
    var sources: SourceFilesList?
    var resources: ResourceFileElements?
    var copyFiles: [CopyFilesAction]?
    var headers: Headers?
    var entitlements: Path?
    var scripts: [TargetScript]
    var dependencies: [TargetDependency]
    var settings: Settings?
    var coreDataModels: [CoreDataModel]
    var environment: [String: String]
    var launchArguments: [LaunchArgument]
    var additionalFiles: [FileElement]
    
    public init(
        name: String = "",
        platform: Platform = .iOS,
        product: Product = .staticLibrary,
        productName: String? = nil,
        bundleId: String? = nil,
        deploymentTarget: DeploymentTarget? = nil,
        infoPlist: InfoPlist = .default,
        sources: SourceFilesList? = .sources,
        resources: ResourceFileElements? = nil,
        copyFiles: [CopyFilesAction]? = nil,
        headers: Headers? = nil,
        entitlements: Path? = nil,
        scripts: [TargetScript] = [],
        dependencies: [TargetDependency] = [],
        settings: Settings? = nil,
        coreDataModels: [CoreDataModel] = [],
        environment: [String : String] = [:],
        launchArguments: [LaunchArgument] = [],
        additionalFiles: [FileElement] = []) {
        self.name = name
        self.platform = platform
        self.product = product
        self.productName = productName
        self.deploymentTarget = Project.Environment.deploymentTarget
        self.bundleId = bundleId
        self.infoPlist = infoPlist
        self.sources = sources
        self.resources = resources
        self.copyFiles = copyFiles
        self.headers = headers
        self.entitlements = entitlements
        self.scripts = scripts
        self.dependencies = dependencies
        self.settings = settings
        self.coreDataModels = coreDataModels
        self.environment = environment
        self.launchArguments = launchArguments
        self.additionalFiles = additionalFiles
    }
}

public extension Target {
    private static func make(factory: TargetFactory) -> Self {
        return .init(
            name: factory.name,
            platform: factory.platform,
            product: factory.product,
            productName: factory.productName,
            bundleId: factory.bundleId ?? Project.Environment.bundlePrefix + ".\(factory.name)",
            deploymentTarget: factory.deploymentTarget,
            infoPlist: factory.infoPlist,
            sources: factory.sources,
            resources: factory.resources,
            copyFiles: factory.copyFiles,
            headers: factory.headers,
            entitlements: factory.entitlements,
            scripts: factory.scripts,
            dependencies: factory.dependencies,
            settings: factory.settings,
            coreDataModels: factory.coreDataModels,
            environment: factory.environment,
            launchArguments: factory.launchArguments,
            additionalFiles: factory.additionalFiles
        )
    }
}

// MARK: Target + App

public extension Target {
    static func app(implements module: ModulePath.App, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.App.name + module.rawValue
        
        switch module {
        case .IOS:
            newFactory.platform = .iOS
            newFactory.product = .app
            newFactory.name = Project.Environment.appName
            newFactory.bundleId = Project.Environment.bundlePrefix
            newFactory.productName = "Pumping"
        case .Watch:
            newFactory.platform = .watchOS
            newFactory.product = .watch2App
            newFactory.bundleId = Project.Environment.bundlePrefix + ".watch"
            newFactory.sources = nil
            newFactory.deploymentTarget = Project.Environment.watchDeploymentTarget
        case .WatchExtension:
            newFactory.platform = .watchOS
            newFactory.product = .watch2Extension
            newFactory.bundleId = Project.Environment.bundlePrefix + ".watch.extension"
            newFactory.sources = .watchExtensionSources
            newFactory.deploymentTarget = Project.Environment.watchDeploymentTarget
        }
        return make(factory: newFactory)
    }
}


// MARK: Target + Feature

public extension Target {
    static func feature(factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Feature.name
        
        return make(factory: newFactory)
    }
    
    static func feature(implements module: ModulePath.Feature, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Feature.name + module.rawValue
        
        return make(factory: newFactory)
    }
    
    static func feature(tests module: ModulePath.Feature, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Feature.name + module.rawValue + "Tests"
        newFactory.sources = .tests
        newFactory.product = .unitTests
        
        return make(factory: newFactory)
    }
    
    static func feature(testing module: ModulePath.Feature, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Feature.name + module.rawValue + "Testing"
        newFactory.sources = .testing
        
        return make(factory: newFactory)
    }
    
    static func feature(interface module: ModulePath.Feature, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Feature.name + module.rawValue + "Interface"
        newFactory.sources = .interface
        
        return make(factory: newFactory)
    }
    
    static func feature(example module: ModulePath.Feature, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Feature.name + module.rawValue + "Example"
        newFactory.sources = .exampleSources
        newFactory.product = .app
        
        return make(factory: newFactory)
    }
}

// MARK: Target + Domain

public extension Target {
    static func domain(factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Domain.name
        
        return make(factory: newFactory)
    }
    
    static func domain(implements module: ModulePath.Domain, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Domain.name + module.rawValue
        
        return make(factory: newFactory)
    }
    
    static func domain(tests module: ModulePath.Domain, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Domain.name + module.rawValue + "Tests"
        newFactory.product = .unitTests
        newFactory.sources = .tests
        
        return make(factory: newFactory)
    }
    
    static func domain(testing module: ModulePath.Domain, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Domain.name + module.rawValue + "Testing"
        newFactory.sources = .testing
        
        return make(factory: newFactory)
    }
    
    static func domain(interface module: ModulePath.Domain, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Domain.name + module.rawValue + "Interface"
        newFactory.sources = .interface
        
        return make(factory: newFactory)
    }
}

// MARK: Target + Core

public extension Target {
    static func core(factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Core.name
        
        return make(factory: newFactory)
    }
    
    static func core(implements module: ModulePath.Core, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Core.name + module.rawValue
        
        return make(factory: newFactory)
    }
    
    static func core(tests module: ModulePath.Core, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Core.name + module.rawValue + "Tests"
        newFactory.product = .unitTests
        newFactory.sources = .tests
        
        return make(factory: newFactory)
    }
    
    static func core(testing module: ModulePath.Core, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Core.name + module.rawValue + "Testing"
        newFactory.sources = .testing
        
        return make(factory: newFactory)
    }
    
    static func core(interface module: ModulePath.Core, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Core.name + module.rawValue + "Interface"
        newFactory.sources = .interface
        
        return make(factory: newFactory)
    }
}

// MARK: Target + Shared

public extension Target {
    static func shared(factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Shared.name
        
        return make(factory: newFactory)
    }
    
    static func shared(implements module: ModulePath.Shared, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Shared.name + module.rawValue
        
        if module == .DesignSystem {
            newFactory.sources = nil
            newFactory.resources = ["Resources/**"]
            newFactory.product = .staticFramework
        }
        
        return make(factory: newFactory)
    }
    
    static func shared(interface module: ModulePath.Shared, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.Shared.name + module.rawValue + "Interface"
        newFactory.sources = .interface
        
        return make(factory: newFactory)
    }
}

// MARK: Target + Shared

public extension Target {
    static func watchShared(factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.WatchShared.name
        newFactory.sources = nil
        newFactory.platform = .watchOS
        newFactory.product = .staticFramework
        newFactory.deploymentTarget = Project.Environment.watchDeploymentTarget
        
        
        return make(factory: newFactory)
    }
    
    static func watchShared(implements module: ModulePath.WatchShared, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = ModulePath.WatchShared.name + module.rawValue
        newFactory.platform = .watchOS
        newFactory.deploymentTarget = Project.Environment.watchDeploymentTarget
        newFactory.sources = nil
        
        if module == .DesignSystem {
            newFactory.resources = ["Resources/**"]
            newFactory.product = .staticFramework
        }
        
        return make(factory: newFactory)
    }
}
