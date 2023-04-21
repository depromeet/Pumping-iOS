//
//  Project+Enviroment.swift
//  DependecnyPlugin
//
//  Created by 송영모 on 2023/04/21.
//

import ProjectDescription

public enum Environment {
    public static let appName = "GatherMove"
    public static let organizationName = "com.82team.gathermove"
    public static let deploymentTarget: DeploymentTarget = .iOS(targetVersion: "16.0", devices: [.iphone])
    public static let platform = Platform.iOS
    public static let baseSetting: SettingsDictionary = SettingsDictionary()
}
