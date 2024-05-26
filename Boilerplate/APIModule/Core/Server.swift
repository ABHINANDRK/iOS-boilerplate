//
//  Server.swift
//  Boilerplate
//
//  Created by Abhinand on 25/09/21.
//

import Foundation

enum Server {

    case UserManagement
    case OnBoarding

    var baseURL: URL {
        switch self {
        case .UserManagement:
            return URL(string: bolerPlateBaseURL)!
        case .OnBoarding:
            return URL(string: bolerPlateBaseURL)!
        }
    }

    private var bolerPlateBaseURL: String {
        "https://\(Bundle.main.infoDictionary?["BaseUrl"] as? String ?? "")"
        
    }
}
