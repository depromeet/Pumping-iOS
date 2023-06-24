import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePath.Domain.name+ModulePath.Domain.Crew.rawValue,
    targets: [    
        .domain(
            interface: .Crew,
            factory: .init()
        ),
        .domain(
            implements: .Crew,
            factory: .init(
                dependencies: [
                    .domain(interface: .Crew)
                ]
            )
        ),
        .domain(
            testing: .Crew,
            factory: .init(
                dependencies: [
                    .domain(interface: .Crew)
                ]
            )
        ),
        .domain(
            tests: .Crew,
            factory: .init(
                dependencies: [
                    .domain(testing: .Crew)
                ]
            )
        ),
    ]
)
