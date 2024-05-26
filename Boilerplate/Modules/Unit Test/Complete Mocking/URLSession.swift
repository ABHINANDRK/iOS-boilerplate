//
//  URLSession.swift
//  Boilerplate
//
//  Created by Abhinand on 12/11/21.
//

import Foundation


protocol NetworkSession {
    func loadData(from url: URL,
                  completionHandler: @escaping (Data?, Error?) -> Void)
}


extension URLSession: NetworkSession {
    
    func loadData(from url: URL,
                  completionHandler: @escaping (Data?, Error?) -> Void) {
        let task = dataTask(with: url) { (data, _, error) in
            completionHandler(data, error)
        }

        task.resume()
    }
}
