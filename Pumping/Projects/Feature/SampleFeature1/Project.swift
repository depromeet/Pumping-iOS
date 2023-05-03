import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePath.Feature.name+ModulePath.Feature.SampleFeature1.rawValue,
    targets: [    
    .feature(
        interface: .SampleFeature1,
        factory: .init()
    ),
    .feature(
        testing: .SampleFeature1,
        factory: .init(
            dependencies: [
                .feature(interface: .SampleFeature1)
            ]
        )
    ),
    .feature(
        tests: .SampleFeature1,
        factory: .init(
            dependencies: [
                .feature(testing: .SampleFeature1)
            ]
        )
    ),
    .feature(
        example: .SampleFeature1,
        factory: .init(
            dependencies: [
                .feature(interface: .SampleFeature1)
            ]
        )
    )
    ]
)
