//
//  File.swift
//
//
//  Created by Tibor Bodecs on 18/04/2024.
//

public struct RunAllScriptExecutionPolicy: ScriptExecutionPolicy {

    public func shouldExecute(
        _ script: any Script.Type
    ) throws -> Bool {
        true
    }

    public func didExecute(
        _ script: any Script.Type
    ) throws {

    }
}

extension ScriptExecutionPolicy where Self == RunAllScriptExecutionPolicy {

    public static var runAll: ScriptExecutionPolicy {
        RunAllScriptExecutionPolicy()
    }
}
