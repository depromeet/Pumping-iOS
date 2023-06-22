import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePath.Feature.name+ModulePath.Feature.Crew.rawValue,
    targets: [
        .feature(
            interface: .Crew,
            factory: .init(
                dependencies: [
                    .domain,
                    .feature(interface: .Profile)
                ]
            )
        ),
        .feature(
            implements: .Crew,
            factory: .init(
                dependencies: [
                    .feature(interface: .Crew),
                    .feature(interface: .Profile)
                ]
            )
        ),
        .feature(
            testing: .Crew,
            factory: .init(
                dependencies: [
                    .feature(interface: .Crew)
                ]
            )
        ),
        .feature(
            tests: .Crew,
            factory: .init(
                dependencies: [
                    .feature(testing: .Crew)
                ]
            )
        ),
        .feature(
            example: .Crew,
            factory: .init(
                infoPlist: .extendingDefault(
                    with: [
                        "CFBundleShortVersionString": "1.0",
                        "CFBundleVersion": "1",
                        "UILaunchStoryboardName": "LaunchScreen",
                        "UIApplicationSceneManifest": [
                            "UIApplicationSupportsMultipleScenes": false,
                            "UISceneConfigurations": []
                        ]
                    ]),
                dependencies: [
                    .feature(interface: .Crew),
                    .feature(implements: .Crew)
                ]
            )
        )
    ]
)
