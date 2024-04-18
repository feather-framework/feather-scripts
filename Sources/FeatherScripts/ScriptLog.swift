//
//  File.swift
//
//
//  Created by Tibor Bodecs on 04/01/2024.
//

import Foundation

public struct ScriptLog: Codable, Equatable {

    public let id: String
    public let executedAt: Date

    public init(
        id: String,
        executedAt: Date = .init()
    ) {
        self.id = id
        self.executedAt = executedAt
    }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
