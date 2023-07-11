import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePath.Domain.name+ModulePath.Domain.WatchConnectivity.rawValue,
    targets: [    
        .domain(
            interface: .WatchConnectivity,
            factory: .init(
                dependencies: [
                    .domain(interface: .Workout),
                    .core
                ]
            )
        ),
        .domain(
            implements: .WatchConnectivity,
            factory: .init(
                dependencies: [
                    .domain(interface: .WatchConnectivity)
                ]
            )
        ),
        .domain(
            testing: .WatchConnectivity,
            factory: .init(
                dependencies: [
                    .domain(interface: .WatchConnectivity)
                ]
            )
        ),
        .domain(
            tests: .WatchConnectivity,
            factory: .init(
                dependencies: [
                    .domain(testing: .WatchConnectivity)
                ]
            )
        ),
    ]
)
