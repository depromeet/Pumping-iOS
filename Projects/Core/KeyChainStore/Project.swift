import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePath.Core.name+ModulePath.Core.KeyChainStore.rawValue,
    targets: [    
        .core(
            interface: .KeyChainStore,
            factory: .init()
        ),
        .core(
            implements: .KeyChainStore,
            factory: .init(
                dependencies: [
                    .core(interface: .KeyChainStore)
                ]
            )
        ),
        .core(
            testing: .KeyChainStore,
            factory: .init(
                dependencies: [
                    .core(interface: .KeyChainStore)
                ]
            )
        ),
        .core(
            tests: .KeyChainStore,
            factory: .init(
                dependencies: [
                    .core(testing: .KeyChainStore)
                ]
            )
        ),
    ]
)
