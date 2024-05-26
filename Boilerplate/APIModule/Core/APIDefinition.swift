//
//  BPTargetType.swift
//  Boilerplate
//
//  Created by Abhinand on 25/09/21.
//

import Foundation
import Moya

class APIDefinition {
    var server: Server
    var path: String
    var method: Moya.Method = .get
    var headers: [String: String]? = APIConfiguration.defaultHeaders.dictionary
    var task: Task = .requestPlain
    var sampleData: Data
    
    /// If it's `false`, and if we try to call multiple instances of
    /// this api at the same time, then only one API is fired and all the other
    /// instances will get same response
    var alwaysForceRefresh: Bool {
        identifier == nil
    }

    /// This string would be used to compare if two API calls are same or not
    /// returning nil would make this API Unique and it will not match with any other API
    /// ie. returning nil would return `==` as false with any other api
    var identifier: String?
    
    init(server: Server,
         path: String,
         method: Moya.Method = .get,
         headers: [String: String]? = APIConfiguration.defaultHeaders.dictionary,
         task: Task = .requestPlain,
         identifier: String? = nil,
         sampleData: Data = Data()) {
        
        self.server = server
        self.path = path
        self.method = method
        self.headers = headers
        self.task = task
        self.identifier = identifier
        self.sampleData = sampleData
    }
}

// MARK: - Builders
extension APIDefinition {

    func setIdentifier(_ identifier: String?) -> Self {
        self.identifier = identifier
        return self
    }
}
