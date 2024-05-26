//
//  Presenter.swift
//  Boilerplate
//
//  Created by Abhinand on 12/11/21.
//

import Foundation


class ArtistDetailPresenterMock: ArtistDetailPresenter {
    
    private(set) var onViewLoadedCalled = false
    
    func onViewLoaded() {
        onViewLoadedCalled = true
    }
    
    private(set) var onEditCalled = false
    
    func onEdit() {
        onEditCalled = true
    }
}
