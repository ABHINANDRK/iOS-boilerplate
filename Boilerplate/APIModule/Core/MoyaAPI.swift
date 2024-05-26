//
//  MoyaAPI.swift
//  Boilerplate
//
//  Created by Abhinand on 01/11/21.
//

import Alamofire
import Foundation
import Moya
import UIKit

protocol IMoyaAPIModule {
    var dummyModule: MoyaProvider<DummyAPITarget> { get }
}

struct MoyaAPIModuleImpl: IMoyaAPIModule {
    
    static let shared = MoyaAPIModuleImpl()
    
    static var isUnitTesting: Bool = false
    
    var dummyModule = MoyaProvider<DummyAPITarget>(
        callbackQueue: MoyaConfiguration.callbackQueue,
        session: MoyaConfiguration.session
    )
    
}

struct MoyaConfiguration {
    static var callbackQueue: DispatchQueue? = .main
    
    static let session: Session = {
        let manager = Session()
        
        return manager
    }()
    
    static let reachabilityManager = NetworkReachabilityManager()
}
