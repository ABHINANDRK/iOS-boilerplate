//
//  APIConfiguration.swift
//  Boilerplate
//
//  Created by Abhinand on 24/09/21.
//

import Foundation
import Alamofire
import Moya

struct APIConfiguration {
    static var defaultHeaders: HTTPHeaders = APIConfiguration.getHttpHeaders()
    
    static func getHttpHeaders() -> HTTPHeaders {
        [
            "Content-Type": "application/json",
            "X-IQ-Platform": "ios",
            "X-IQ-Locale": "US",
            "X-IQ-AppVersion":  Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        ]
    }
    
    static func getHttpHeadersWithToken() -> HTTPHeaders {
        guard  let currentAccesToken =  UserDefaults.standard.string(forKey: "token") else {
            return getHttpHeaders()
        }
        
        var headersWithToken = getHttpHeaders()
        headersWithToken.add(name: "Authorization", value: "Bearer " + (currentAccesToken))
        return getHttpHeaders()
        
    }
    
    static var platform = "ios"
}

extension Task {
    static func requestURLParameters(_ parameters: [String: Any]) -> Task {
        .requestParameters(parameters: parameters, encoding: URLEncoding.default)
    }

    static func requestJSONParameters(_ parameters: [String: Any]) -> Task {
        .requestParameters(parameters: parameters, encoding: JSONEncoding())
    }
}
