//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 송영모 on 2023/04/21.
//

import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin


let targets: [Target] = [
    .app(
        implements: .IOS,
        factory: .init(
            infoPlist: .extendingDefault(
                with: [
                    "UIUserInterfaceStyle": "Dark",
                    "BASE_URL": "https://pumpapp.net/",
                    "BASE_URL_PREFIX": "api/v1/",
                    "BASE_URL_BYPASS_PREFIX": "bypass/",
                    "CFBundleShortVersionString": "1.2",
                    "CFBundleVersion": "1",
                    "CFBundleName": "Pumping",
                    "CFBundleIconName": "AppIcon",
                    "UILaunchStoryboardName": "LaunchScreen",
                    "UIApplicationSceneManifest": [
                        "UIApplicationSupportsMultipleScenes": false,
                        "UISceneConfigurations": []
                    ],
                    "NSHealthShareUsageDescription" : "이 앱은 운동, 수면 및 건강 정보를 추적하고 관리하기 위해 HealthKit 데이터를 공유할 수 있습니다.",
                    "NSHealthUpdateUsageDescription" : "이 앱은 운동, 수면 및 건강 정보를 추적하고 관리하기 위해 HealthKit 데이터를 기록할 수 있습니다.",
                ]),
            entitlements: "Pumping.entitlements",
            dependencies: [
                .app(implements: .Watch),
                .feature
            ]
        )
    ),
    .app(
        implements: .Watch,
        factory: .init(
            infoPlist: .extendingDefault(
                with: [
                    "CFBundleShortVersionString": "1.2",
                    "CFBundleVersion": "1",
                ]),
            dependencies: [
                .app(implements: .WatchExtension)
            ]
        )
    ),
    .app(
        implements: .WatchExtension,
        factory: .init(
            infoPlist: .extendingDefault(
                with: [
                    "CFBundleShortVersionString": "1.2",
                    "CFBundleVersion": "1",
                    "NSHealthShareUsageDescription" : "이 앱은 운동, 수면 및 건강 정보를 추적하고 관리하기 위해 HealthKit 데이터를 공유할 수 있습니다.",
                    "NSHealthUpdateUsageDescription" : "이 앱은 운동, 수면 및 건강 정보를 추적하고 관리하기 위해 HealthKit 데이터를 기록할 수 있습니다.",
                ]),
            entitlements: "Pumping.entitlements",
            dependencies: [
                .watchShared
            ]
        )
    )
]

let project: Project = .makeModule(
    name: "Pumping",
    targets: targets
)
