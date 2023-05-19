import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePath.Feature.name+ModulePath.Feature.Home.rawValue,
    targets: [
        .feature(
            interface: .Home,
            factory: .init(
                dependencies: [
                    .domain
                ]
            )
        ),
        .feature(
            implements: .Home,
            factory: .init(
                dependencies: [
                    .feature(interface: .Home)
                ]
            )
        ),
        .feature(
            testing: .Home,
            factory: .init(
                dependencies: [
                    .feature(interface: .Home)
                ]
            )
        ),
        .feature(
            tests: .Home,
            factory: .init(
                dependencies: [
                    .feature(testing: .Home)
                ]
            )
        ),
        .feature(
            example: .Home,
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
                    .feature(interface: .Home),
                    .feature(implements: .Home)
                ]
            )
        )
    ]
)
