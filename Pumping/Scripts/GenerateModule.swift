#!/usr/bin/swift
import Foundation

enum LayerType: String {
    case feature = "Feature"
    case domain = "Domain"
    case core = "Core"
    case shared = "Shared"
}

public enum MicroTargetType: String, CaseIterable {
    case Example = "Example"
    case Sources = ""
    case Tests = "Tests"
    case Testing = "Testing"
    case Interface = "Interface"
}

let fileManager = FileManager.default
let currentPath = "./"
let bash = Bash()

func registerModuleDependency() {
    registerModulePath()
    makeProjectDirectory()
    
    var targetString = "["
    
    makeScaffold(target: .Interface)
    targetString += """
        
            .\(layer.rawValue.lowercased())(
                interface: .\(moduleName),
                factory: .init()
            ),
            .\(layer.rawValue.lowercased())(
                implements: .\(moduleName),
                factory: .init(
                    dependencies: [
                        .\(layer.rawValue.lowercased())(interface: .\(moduleName))
                    ]
                )
            ),
    
    """
    
    
    if hasUnitTests {
        makeScaffold(target: .Testing)
        makeScaffold(target: .Tests)
        targetString += """
            
                .\(layer.rawValue.lowercased())(
                    testing: .\(moduleName),
                    factory: .init(
                        dependencies: [
                            .\(layer.rawValue.lowercased())(interface: .\(moduleName))
                        ]
                    )
                ),
                .\(layer.rawValue.lowercased())(
                    tests: .\(moduleName),
                    factory: .init(
                        dependencies: [
                            .\(layer.rawValue.lowercased())(testing: .\(moduleName))
                        ]
                    )
                ),
        
        """
    }

    if hasExample {
        makeScaffold(target: .Example)
        targetString += """
            
                .\(layer.rawValue.lowercased())(
                    example: .\(moduleName),
                    factory: .init(
                        dependencies: [
                            .\(layer.rawValue.lowercased())(interface: .\(moduleName))
                        ]
                    )
                )
        
        """
    }
    
    if targetString.hasSuffix(", ") {
        targetString.removeLast(2)
    }
    
    targetString += """
    
        ]
    """
    
    makeProjectSwift(targetString: targetString)
    makeProjectScaffold(targetString: targetString)
}

func registerModulePath() {
    updateFileContent(
        filePath: currentPath + "Plugins/DependencyPlugin/ProjectDescriptionHelpers/Modules.swift",
        finding: "enum \(layer.rawValue): String, CaseIterable {\n",
        inserting: "        case \(moduleName)\n"
    )
    print("Register \(layer.rawValue)Layer's \(moduleName)Module to Modules.swift")
}


func makeDirectory(path: String) {
    do {
        try fileManager.createDirectory(atPath: path, withIntermediateDirectories: false, attributes: nil)
    } catch {
        fatalError("❌ failed to create directory: \(path)")
    }
}

func makeDirectories(_ paths: [String]) {
    paths.forEach(makeDirectory(path:))
}

func makeProjectSwift(targetString: String) {
    let projectSwift = """
import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePath.\(layer.rawValue).name+ModulePath.\(layer.rawValue).\(moduleName).rawValue,
    targets: \(targetString)
)

"""
    writeContentInFile(
        path: currentPath + "Projects/\(layer.rawValue)/\(moduleName)/Project.swift",
        content: projectSwift
    )
}

func makeProjectDirectory() {
    makeDirectory(path: currentPath + "Projects/\(layer.rawValue)/\(moduleName)")
}

func makeProjectScaffold(targetString: String) {
    _ = try? bash.run(
        commandName: "tuist",
        arguments: ["scaffold", "Module", "--name", "\(moduleName)", "--layer", "\(layer.rawValue)", "--target", "\(targetString)"]
    )
}

func makeScaffold(target: MicroTargetType) {
    _ = try? bash.run(
        commandName: "tuist",
        arguments: ["scaffold", "\(target.rawValue)", "--name", "\(moduleName)", "--layer", "\(layer.rawValue)"]
    )
}

func writeContentInFile(path: String, content: String) {
    let fileURL = URL(fileURLWithPath: path)
    let data = Data(content.utf8)
    try? data.write(to: fileURL)
}

func updateFileContent(
    filePath: String,
    finding findingString: String,
    inserting insertString: String
) {
    let fileURL = URL(fileURLWithPath: filePath)
    guard let readHandle = try? FileHandle(forReadingFrom: fileURL) else {
        fatalError("❌ Failed to find \(filePath)")
    }
    guard let readData = try? readHandle.readToEnd() else {
        fatalError("❌ Failed to find \(filePath)")
    }
    try? readHandle.close()

    guard var fileString = String(data: readData, encoding: .utf8) else { fatalError() }
    fileString.insert(contentsOf: insertString, at: fileString.range(of: findingString)?.upperBound ?? fileString.endIndex)

    guard let writeHandle = try? FileHandle(forWritingTo: fileURL) else {
        fatalError("❌ Failed to find \(filePath)")
    }
    writeHandle.seek(toFileOffset: 0)
    try? writeHandle.write(contentsOf: Data(fileString.utf8))
    try? writeHandle.close()
}


// MARK: - Starting point

print("Enter layer name\n(Feature | Domain | Core | Shared)", terminator: " : ")
let layerInput = readLine()
guard let layerInput, !layerInput.isEmpty, let layerUnwrapping = LayerType(rawValue: layerInput) else {
    print("Layer is empty or invalid")
    exit(1)
}
let layer = layerUnwrapping
print("Layer: \(layer.rawValue)\n")

print("Enter module name", terminator: " : ")
let moduleInput = readLine()
guard let moduleNameUnwrapping = moduleInput, !moduleNameUnwrapping.isEmpty else {
    print("Module name is empty")
    exit(1)
}
var moduleName = moduleNameUnwrapping
print("Module name: \(moduleName)\n")

print("This module has a 'Tests' Target? (y\\n, default = n)", terminator: " : ")
let hasUnitTests = readLine()?.lowercased() == "y"

var hasExample = false
if layer.rawValue == "Feature" {
    print("This module has a 'Example' Target? (y\\n, default = n)", terminator: " : ")
    hasExample = readLine()?.lowercased() == "y"
}

print("")

registerModuleDependency()

print("")
print("------------------------------------------------------------------------------------------------------------------------")
print("Layer: \(layer.rawValue)")
print("Module name: \(moduleName)")
print("unitTests: \(hasUnitTests), example: \(hasExample)")
print("------------------------------------------------------------------------------------------------------------------------")
print("✅ Module is created successfully!")



// MARK: - Bash
protocol CommandExecuting {
    func run(commandName: String, arguments: [String]) throws -> String
}

enum BashError: Error {
    case commandNotFound(name: String)
}

struct Bash: CommandExecuting {
    func run(commandName: String, arguments: [String] = []) throws -> String {
        return try run(resolve(commandName), with: arguments)
    }

    private func resolve(_ command: String) throws -> String {
        guard var bashCommand = try? run("/bin/bash" , with: ["-l", "-c", "which \(command)"]) else {
            throw BashError.commandNotFound(name: command)
        }
        bashCommand = bashCommand.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        return bashCommand
    }

    private func run(_ command: String, with arguments: [String] = []) throws -> String {
        let process = Process()
        process.launchPath = command
        process.arguments = arguments
        let outputPipe = Pipe()
        process.standardOutput = outputPipe
        process.launch()
        let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(decoding: outputData, as: UTF8.self)
        return output
    }
}
