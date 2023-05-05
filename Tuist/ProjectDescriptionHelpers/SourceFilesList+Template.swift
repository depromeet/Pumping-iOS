//
//  SourceFilesList+Template.swift
//  ProjectDescriptionHelpers
//
//  Created by 박현우 on 2023/05/02.
//

import ProjectDescription

public extension SourceFilesList {
    static let exampleSources: SourceFilesList = "Example/Sources/**"
    static let interface: SourceFilesList = "Interface/Sources/**"
    static let sources: SourceFilesList = "Sources/**"
    static let testing: SourceFilesList = "Testing/Sources/**"
    static let tests: SourceFilesList = "Tests/Sources/**"
    static let watchExtensionSources : SourceFilesList = "WatchExtension/Sources/**"
}
