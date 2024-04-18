//
//  File.swift
//
//
//  Created by Tibor Bodecs on 03/12/2023.
//

import FeatherComponent

public protocol Script {

    static var identifier: String { get }

    static func run(
        _ components: ComponentRegistry
    ) async throws
}

extension Script {

    public static var identifier: String {
        String(reflecting: self)
    }
}
