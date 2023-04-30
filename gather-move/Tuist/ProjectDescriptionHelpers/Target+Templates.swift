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
        product: Product = .staticFramework,
        productName: String? = nil,
        bundleId: String? = nil,
        deploymentTarget: DeploymentTarget? = nil,
        infoPlist: InfoPlist = .default,
        sources: SourceFilesList? = ["Sources/**"],
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
    static func app(implements module: AppModule, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = AppModule.name + module.rawValue
        
        switch module {
        case .IOS:
            newFactory.platform = .iOS
            newFactory.product = .app
            newFactory.name = "Pumping"
            newFactory.bundleId = "com.dpm.pumping"
            newFactory.productName = "Pumping"
        case .Watch:
            newFactory.platform = .watchOS
            newFactory.product = .watch2App
            newFactory.bundleId = "com.dpm.pumping.watch"
            newFactory.sources = nil
            newFactory.bundleId = "com.82team.pumping.watch"
            newFactory.deploymentTarget = Project.Environment.watchDeploymentTarget
        case .WatchExtension:
            newFactory.platform = .watchOS
            newFactory.product = .watch2Extension
            newFactory.sources = ["WatchExtension/Sources/**"]
            newFactory.bundleId = "com.dpm.pumping.watch.extension"
            newFactory.deploymentTarget = Project.Environment.watchDeploymentTarget
        }
        return make(factory: newFactory)
    }
}


// MARK: Target + Feature

public extension Target {
    static func feature(factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = FeatureModule.name
        newFactory.product = .framework
        
        return make(factory: newFactory)
    }
    
    static func feature(implements module: FeatureModule, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = FeatureModule.name + module.rawValue
        newFactory.product = .framework
        
        return make(factory: newFactory)
    }
    
    static func feature(tests module: FeatureModule, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = FeatureModule.name + module.rawValue + "Tests"
        newFactory.sources = ["Tests/Sources/**"]
        newFactory.product = .unitTests
        
        return make(factory: newFactory)
    }
    
    static func feature(testing module: FeatureModule, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = FeatureModule.name + module.rawValue + "Testing"
        newFactory.sources = ["Testing/Sources/**"]
        newFactory.product = .staticLibrary
        
        return make(factory: newFactory)
    }
    
    static func feature(interface module: FeatureModule, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = FeatureModule.name + module.rawValue + "Interface"
        newFactory.product = .framework
        newFactory.sources = ["Interface/Sources/**"]
        
        return make(factory: newFactory)
    }
}

// MARK: Target + Domain

public extension Target {
    static func domain(factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = DomainModule.name
        newFactory.product = .framework
        
        return make(factory: newFactory)
    }
    
    static func domain(implements module: DomainModule, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = DomainModule.name + module.rawValue
        newFactory.product = .framework
        
        return make(factory: newFactory)
    }
    
    static func domain(tests module: DomainModule, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = DomainModule.name + module.rawValue + "Tests"
        newFactory.product = .unitTests
        newFactory.sources = ["Tests/Sources/**"]
        
        return make(factory: newFactory)
    }
    
    static func domain(testing module: DomainModule, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = DomainModule.name + module.rawValue + "Testing"
        newFactory.product = .staticLibrary
        newFactory.sources = ["Testing/Sources/**"]
        
        return make(factory: newFactory)
    }
    
    static func domain(interface module: DomainModule, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = DomainModule.name + module.rawValue + "Interface"
        newFactory.product = .framework
        newFactory.sources = ["Interface/Sources/**"]
        
        return make(factory: newFactory)
    }
}

// MARK: Target + Core

public extension Target {
    static func core(factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = CoreModule.name
        newFactory.product = .framework
        
        return make(factory: newFactory)
    }
    
    static func core(implements module: CoreModule, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = CoreModule.name + module.rawValue
        newFactory.product = .framework
        
        return make(factory: newFactory)
    }
    
    static func core(tests module: CoreModule, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = CoreModule.name + module.rawValue + "Tests"
        newFactory.product = .unitTests
        newFactory.sources = ["Tests/Sources/**"]
        
        return make(factory: newFactory)
    }
    
    static func core(testing module: CoreModule, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = CoreModule.name + module.rawValue + "Testing"
        newFactory.product = .staticLibrary
        newFactory.sources = ["Testing/Sources/**"]
        
        return make(factory: newFactory)
    }
    
    static func core(interface module: CoreModule, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = CoreModule.name + module.rawValue + "Interface"
        newFactory.product = .framework
        newFactory.sources = ["Interface/Sources/**"]
        
        return make(factory: newFactory)
    }
}

// MARK: Target + Shared

public extension Target {
    static func shared(factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = SharedModule.name
        newFactory.product = .framework
        
        return make(factory: newFactory)
    }
    
    static func shared(implements module: SharedModule, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = SharedModule.name + module.rawValue
        
        switch module {
        case .DesignSystem:
            newFactory.resources = ["Resources/**"]
            newFactory.product = .staticFramework
        case .ThirdPartyLib:
            newFactory.sources = nil
            newFactory.product = .staticFramework
        }
        
        return make(factory: newFactory)
    }
}

// MARK: Target + Shared

public extension Target {
    static func watchShared(factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = WatchSharedModule.name
        newFactory.sources = nil
        newFactory.platform = .watchOS
        newFactory.product = .framework
        newFactory.deploymentTarget = Project.Environment.watchDeploymentTarget
        
        
        return make(factory: newFactory)
    }
    
    static func watchShared(implements module: WatchSharedModule, factory: TargetFactory) -> Self {
        var newFactory = factory
        newFactory.name = WatchSharedModule.name + module.rawValue
        newFactory.platform = .watchOS
        newFactory.deploymentTarget = Project.Environment.watchDeploymentTarget
        
        switch module {
        case .DesignSystem:
            newFactory.sources = nil
            newFactory.resources = ["Resources/**"]
            newFactory.product = .staticFramework
        case .ThirdPartyLib:
            newFactory.sources = nil
            newFactory.product = .staticFramework
        }
        
        return make(factory: newFactory)
    }
}
