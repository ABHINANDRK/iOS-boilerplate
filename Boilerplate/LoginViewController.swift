//
//  ViewController.swift
//  Boilerplate
//
//  Created by Abhinand on 10/09/21.
//

import UIKit

class LoginViewController: UIViewController {

    var viewModel: CryptoViewModel = CryptoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startFetchingData()
    }
    
    func startFetchingData(){
        viewModel.startFetchingData{
            
        }
    }


}

extension LoginViewController: CryptVMDelegate{
    
    func refreshUI() {
    }
    
    func startLoading() {
    }
    
    func stopLoading() {
    }
    
}

