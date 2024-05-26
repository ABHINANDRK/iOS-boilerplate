//
//  ViewControllerTests.swift
//  BoilerplateTests
//
//  Created by Abhinand on 12/11/21.
//

import XCTest
@testable import Boilerplate


class ArtistDetailViewControllerTests: XCTestCase {
    let presenter = ArtistDetailPresenterMock()
    
    
    func testViewDidLoadCallsPresenter() {
        let sut = makeSUT()
        
        sut.viewDidLoad()
        
        XCTAssertTrue(presenter.onViewLoadedCalled)
    }

    func testOnEditCallsPresenter() {
        let sut = makeSUT()
        
        sut.onEdit(.init())
        
        XCTAssertTrue(presenter.onEditCalled)
    }
    
}

extension ArtistDetailViewControllerTests {
    
    func makeSUT() -> ArtistDetailViewController {
        let sut = ArtistDetailViewController()
        sut.presenter = presenter
        sut.loadViewIfNeeded()
        return sut
    }
}
