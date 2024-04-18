//
//  File.swift
//
//
//  Created by Tibor Bodecs on 18/04/2024.
//

public protocol ScriptExecutionPolicy {

    func shouldExecute(
        _ script: Script.Type
    ) throws -> Bool

    func didExecute(
        _ script: Script.Type
    ) throws
}
