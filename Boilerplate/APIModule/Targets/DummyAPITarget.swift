//
//  OnboardingAPITarget.swift
//  Boilerplate
//
//  Created by Abhinand on 24/09/21.
//

import Foundation
import Moya

extension APIDefinition {
    fileprivate static func dummyAPI(server: Server = .OnBoarding,
                                     path: String,
                                     method: Moya.Method,
                                     headers: [String : String]? = APIConfiguration.getHttpHeadersWithToken().dictionary,
                                     task: Task,
                                     identifier: String? = nil,
                                     sampleData: Data = Data()) -> APIDefinition {

        APIDefinition(server: server, path: path, method: method, headers: headers, task: task, identifier: identifier, sampleData: sampleData)

    }
}

enum DummyAPITarget: BPTargetType{
    
    case getCryptoDetails
    
    var definition: APIDefinition{
        switch self {
        case .getCryptoDetails:
            return .dummyAPI( path: "api/fruit/all",
                              method: .get,
                              task: .requestPlain
            )
        }

    }
}

