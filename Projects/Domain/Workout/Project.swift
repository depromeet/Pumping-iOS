import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePath.Domain.name+ModulePath.Domain.Workout.rawValue,
    targets: [    
        .domain(
            interface: .Workout,
            factory: .init()
        ),
        .domain(
            implements: .Workout,
            factory: .init(
                dependencies: [
                    .domain(interface: .Workout)
                ]
            )
        ),
        .domain(
            testing: .Workout,
            factory: .init(
                dependencies: [
                    .domain(interface: .Workout)
                ]
            )
        ),
        .domain(
            tests: .Workout,
            factory: .init(
                dependencies: [
                    .domain(testing: .Workout)
                ]
            )
        ),
    ]
)
