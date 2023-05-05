import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePath.Feature.name+ModulePath.Feature.SampleFeature.rawValue,
    targets: [    
        .feature(
            interface: .SampleFeature,
            factory: .init()
        ),
        .feature(
            implements: .SampleFeature,
            factory: .init(
                dependencies: [
                    .feature(interface: .SampleFeature)
                ]
            )
        ),
        .feature(
            testing: .SampleFeature,
            factory: .init(
                dependencies: [
                    .feature(interface: .SampleFeature)
                ]
            )
        ),
        .feature(
            tests: .SampleFeature,
            factory: .init(
                dependencies: [
                    .feature(testing: .SampleFeature)
                ]
            )
        ),
        .feature(
            example: .SampleFeature,
            factory: .init(
                dependencies: [
                    .feature(interface: .SampleFeature)
                ]
            )
        )
    ]
)
