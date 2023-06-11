import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let targets: [Target] = [
    .feature(
        implements: .Profile,
        factory: .init(
            dependencies: [
                .feature(interface: .Home),
                .feature(interface: .Profile),
                .feature(interface: .Onboarding),
            ]
        )
    ),
    .feature(
        tests: .Profile,
        factory: .init(
            dependencies: [
                .feature(testing: .Profile)
            ]
        )
    ),
    .feature(
        testing: .Profile,
        factory: .init(
            dependencies: [
                .feature(interface: .Profile)
            ]
        )
    ),
    .feature(
        interface: .Profile,
        factory: .init(
            dependencies: [
                .domain
            ]
        )
    )
]

let project: Project = .makeModule(
    name: "FeatureProfile",
    targets: targets
)
