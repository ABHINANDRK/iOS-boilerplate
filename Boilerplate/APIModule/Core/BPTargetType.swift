//
//  File.swift
//  Boilerplate
//
//  Created by Abhinand on 25/09/21.
//

import Foundation
import Moya

protocol BPTargetType: TargetType, Equatable {

    var definition: APIDefinition { get }
}

extension BPTargetType {
    /// The target's base `URL`.
    var baseURL: URL { definition.server.baseURL }

    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String { definition.path }

    /// The HTTP method used in the request.
    var method: Moya.Method { definition.method }

    /// Provides stub data for use in testing.
    var sampleData: Data { definition.sampleData }

    /// The type of HTTP task to be performed.
    var task: Task { definition.task }

    /// The headers to be used in the request.
    var headers: [String: String]? { definition.headers }

    static func == (lhs: Self, rhs: Self) -> Bool {
        if let lhsHash = lhs.definition.identifier,
           let rhsHash = rhs.definition.identifier {

            return lhsHash == rhsHash
        }
        return false
    }
}
