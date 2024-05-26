//
//  NetworkSessionMock.swift
//  Boilerplate
//
//  Created by Abhinand on 12/11/21.
//

import Foundation


class NetworkSessionMock: NetworkSession {
    
    var data: Data?
    var error: Error?

    func loadData(from url: URL,
                  completionHandler: @escaping (Data?, Error?) -> Void) {
        completionHandler(data, error)
    }
}
