//
//  DummyViewModel.swift
//  Boilerplate
//
//  Created by Abhinand on 02/11/21.
//

import Foundation

protocol CryptVMDelegate: AnyObject {
    func refreshUI()
    func startLoading()
    func stopLoading()
}

protocol ISearchHistoryVM: AnyObject {
    var delegate: CryptVMDelegate? { get set }

    func numberOfSections() -> Int
    func numberOfItems(inSection section: Int) -> Int
    func item(at indexPath: IndexPath) -> String?
}

class CryptoViewModel: ISearchHistoryVM {
    
    var repo: ICryptoRepository = CryptoRepository()
    var store: ICryptoDataSource = CryptoDataSource()
    
    var password: String?
    
    weak var delegate: CryptVMDelegate?
    
    func numberOfSections() -> Int {
        store.numberOfSections()
    }
    
    func numberOfItems(inSection section: Int) -> Int {
        store.numberOfItems(InSection: section)
    }
    
    func item(at indexPath: IndexPath) -> String? {
        store.item(at: indexPath)
    }
    
    ///Can add more completions handlers depends on the usecases..eg error completion handler
    func startFetchingData(completion: @escaping () -> Void) {
        repo.fetchCryptoDetails(success: { response in
            self.store.addRecords(cryptoList: response)
            self.delegate?.refreshUI()
            completion()
        }, failure: { error in
            completion()
        })
        
    }
    
    var isValidPassword: Bool {
          let regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,}$"
          let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
          return predicate.evaluate(with: password)
      }

}
