import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePath.Shared.name+ModulePath.Shared.Util.rawValue,
    targets: [    
        .shared(
            interface: .Util,
            factory: .init()
        ),
        .shared(
            implements: .Util,
            factory: .init(
                dependencies: [
                    .shared(interface: .Util)
                ]
            )
        ),
    ]
)
