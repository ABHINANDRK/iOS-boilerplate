//
//  BoilerplateTests.swift
//  BoilerplateTests
//
//  Created by Abhinand on 10/09/21.
//

import XCTest
@testable import Boilerplate

class Tests_CryptoViewModel: XCTestCase {

    var model: CryptoViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        model = CryptoViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        model = nil
    }

    func test_isValidPassword() throws {
        //Arrange
        model.password = "Mobility@123"
        
        //Act
        let isValidPassword = model.isValidPassword
        
        //Assert
        XCTAssertTrue(isValidPassword, "Password is not a valid one")
    }

}
