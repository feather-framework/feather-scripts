//
//  File.swift
//
//
//  Created by Tibor Bodecs on 04/01/2024.
//

import FeatherComponent
import Logging

public struct ScriptExecutor {

    private let components: ComponentRegistry
    private let policy: ScriptExecutionPolicy
    private let logger: Logger

    public init(
        components: ComponentRegistry,
        policy: ScriptExecutionPolicy,
        logger: Logger = .init(label: "script-executor")
    ) {
        self.components = components
        self.policy = policy
        self.logger = logger
    }

    // MARK: - api

    public func execute(
        _ scripts: [Script.Type]
    ) async throws {

        for script in scripts where try policy.shouldExecute(script) {
            logger.trace(
                "running script",
                metadata: [
                    "id": "\(script.identifier)"
                ]
            )
            try await script.run(components)
            try policy.didExecute(script)
        }
    }
}
