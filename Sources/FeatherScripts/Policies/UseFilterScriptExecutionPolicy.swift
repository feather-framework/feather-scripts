//
//  File.swift
//
//
//  Created by Tibor Bodecs on 18/04/2024.
//

import Foundation

public struct UseFilterScriptExecutionPolicy: ScriptExecutionPolicy {

    let filePath: String

    func load() throws -> [ScriptLog] {
        let url = URL(fileURLWithPath: filePath)
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let logs = try decoder.decode(
                [ScriptLog].self,
                from: data
            )
            return logs
        }
        catch {
            return []
        }
    }

    func save(_ logs: [ScriptLog]) throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [
            .prettyPrinted
        ]
        let data = try encoder.encode(logs)
        let url = URL(fileURLWithPath: filePath)
        try data.write(to: url)
    }

    // MARK: -

    public func shouldExecute(
        _ script: any Script.Type
    ) throws -> Bool {
        let logs = try load()
        return !logs.map(\.id).contains(script.identifier)
    }

    public func didExecute(
        _ script: any Script.Type
    ) throws {
        var logs = try load()
        logs.append(
            .init(
                id: script.identifier,
                executedAt: .init()
            )
        )
        try save(logs)
    }
}

extension ScriptExecutionPolicy where Self == UseFilterScriptExecutionPolicy {

    public static func useFilter(filePath: String) -> ScriptExecutionPolicy {
        UseFilterScriptExecutionPolicy(filePath: filePath)
    }
}
