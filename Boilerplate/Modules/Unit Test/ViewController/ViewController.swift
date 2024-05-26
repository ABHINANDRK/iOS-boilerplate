//
//  ViewController.swift
//  Boilerplate
//
//  Created by Abhinand on 12/11/21.
//

import Foundation
import UIKit

protocol ArtistDetailPresenter {
    func onViewLoaded()
    func onEdit()
}

class ArtistDetailViewController: UIViewController {
    
    // IBOutlets
    
    var presenter: ArtistDetailPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewLoaded()
    }
    
    @IBAction func onEdit(_ sender: UIBarButtonItem) {
        presenter.onEdit()
    }
}


