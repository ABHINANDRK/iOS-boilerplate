//
//  APIRepository.swift
//  Boilerplate
//
//  Created by Abhinand on 01/11/21.
//

import Foundation
import Moya

protocol ICryptoRepository{
    func fetchCryptoDetails(success: @escaping ([CryptoDetailsDTO]) -> Void, failure: @escaping (APIResponseError) -> Void)
}

class CryptoRepository: ICryptoRepository{
    
    var apiModule: IMoyaAPIModule = MoyaAPIModuleImpl()
    
    func fetchCryptoDetails(success: @escaping ([CryptoDetailsDTO]) -> Void, failure: @escaping (APIResponseError) -> Void) {
        apiModule.dummyModule.request(.getCryptoDetails, completion: { result in
            result.parseResponse([CryptoDetailsDTO].self, success: success, failure: failure)
        })
    }
}
