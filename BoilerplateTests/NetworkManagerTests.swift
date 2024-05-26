//
//  NetworkManagerTest.swift
//  BoilerplateTests
//
//  Created by Abhinand on 12/11/21.
//

import XCTest
@testable import Boilerplate

class NetworkManagerTests: XCTestCase {
    
    func testSuccessfulResponse() {
        // Setup our objects
        let session = NetworkSessionMock()
        let manager = NetworkManager(session: session)
        
        // Create data and tell the session to always return it
        let data = Data(_: [0, 1, 0, 1])
        session.data = data
        
        // Create a URL (using the file path API to avoid optionals)
        let url = URL(fileURLWithPath: "url")
        
        // Perform the request and verify the result
        var result: Result<Data, Error>?
        manager.loadData(from: url) { response in result = response }
        
        switch result {
        case .success(let count):
            XCTAssertEqual(count, Data(_: [0,1,0,1]))
        case .failure(let error):
            print(error.localizedDescription)
        case .none:
            break
        }
    }
}
