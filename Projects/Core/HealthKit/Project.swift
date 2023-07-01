import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePath.Core.name+ModulePath.Core.HealthKit.rawValue,
    targets: [    
        .core(
            interface: .HealthKit,
            factory: .init()
        ),
        .core(
            implements: .HealthKit,
            factory: .init(
                dependencies: [
                    .core(interface: .HealthKit)
                ]
            )
        ),
    ]
)
