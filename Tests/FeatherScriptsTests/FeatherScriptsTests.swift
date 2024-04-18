//
//  File.swift
//
//
//  Created by Tibor Bodecs on 21/03/2024.
//

import FeatherComponent
import FeatherScripts
import XCTest

enum Foo: Script {

    static func run(
        _ components: ComponentRegistry
    ) async throws {
        print(identifier)
    }
}

enum Bar: Script {

    static let identifier = "custom-identifier"

    static func run(
        _ components: ComponentRegistry
    ) async throws {
        print(identifier)
    }
}

final class FeatherScriptsTests: XCTestCase {

    func testIdentifier() async throws {

        let registry = ComponentRegistry()
        let executor = ScriptExecutor(
            components: registry,
            policy: .runAll
                //            policy: .useFilter(filePath: "/Users/tib/scripts-log.json")
        )

        try await executor.execute(
            [
                Foo.self,
                Bar.self,
            ]
        )

        XCTAssertEqual(Foo.identifier, "FeatherScriptsTests.Foo")
        XCTAssertEqual(Bar.identifier, "custom-identifier")
    }
}
