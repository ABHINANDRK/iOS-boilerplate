//
//  NetworkManager.swift
//  Boilerplate
//
//  Created by Abhinand on 12/11/21.
//

import Foundation

class Network_Manager {
    
    func loadData(from url: URL,
                  completionHandler: @escaping (Result<Int, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            if error != nil {
                completionHandler(.success(5))
            }else{
                completionHandler(.failure(error!))
            }
        }
        
        task.resume()
    }
}
