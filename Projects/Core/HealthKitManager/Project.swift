import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePath.Core.name+ModulePath.Core.HealthKitManager.rawValue,
    targets: [    
        .core(
            interface: .HealthKitManager,
            factory: .init()
        ),
        .core(
            implements: .HealthKitManager,
            factory: .init(
                dependencies: [
                    .core(interface: .HealthKitManager)
                ]
            )
        ),
    ]
)
