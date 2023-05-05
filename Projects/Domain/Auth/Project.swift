import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePath.Domain.name+ModulePath.Domain.Auth.rawValue,
    targets: [    
        .domain(
            interface: .Auth,
            factory: .init()
        ),
        .domain(
            implements: .Auth,
            factory: .init(
                dependencies: [
                    .domain(interface: .Auth)
                ]
            )
        ),
        .domain(
            testing: .Auth,
            factory: .init(
                dependencies: [
                    .domain(interface: .Auth)
                ]
            )
        ),
        .domain(
            tests: .Auth,
            factory: .init(
                dependencies: [
                    .domain(testing: .Auth)
                ]
            )
        ),
    ]
)
