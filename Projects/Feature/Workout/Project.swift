import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePath.Feature.name+ModulePath.Feature.Workout.rawValue,
    targets: [    
        .feature(
            interface: .Workout,
            factory: .init(
                dependencies: [
                    .domain
                ]
            )
        ),
        .feature(
            implements: .Workout,
            factory: .init(
                dependencies: [
                    .feature(interface: .Workout)
                ]
            )
        ),
        .feature(
            testing: .Workout,
            factory: .init(
                dependencies: [
                    .feature(interface: .Workout)
                ]
            )
        ),
        .feature(
            tests: .Workout,
            factory: .init(
                dependencies: [
                    .feature(testing: .Workout)
                ]
            )
        ),
        .feature(
            example: .Workout,
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
                    .feature(interface: .Workout),
                    .feature(implements: .Workout)
                ]
            )
        )
    ]
)
