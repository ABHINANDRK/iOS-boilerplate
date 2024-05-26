//
//  NetworkManager.swift
//  Boilerplate
//
//  Created by Abhinand on 12/11/21.
//

import Foundation

typealias NetworkResult = Result<Data, Error>

class NetworkManager {
    private let session: NetworkSession

    init(session: NetworkSession = URLSession.shared) {
        self.session = session
    }

    func loadData(from url: URL,
                  completionHandler: @escaping (NetworkResult) -> Void) {
        session.loadData(from: url) { data, error in
            
            let result = data.map(NetworkResult.success) ?? .failure(error!)
            completionHandler(result)
//            if error == nil {
//                completionHandler(.success(data))
//            }else{
//                completionHandler(.failure(error!))
//            }
        }
    }
}
