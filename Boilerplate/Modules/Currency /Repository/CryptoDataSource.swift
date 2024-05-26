//
//  CryptoDataSource.swift
//  Boilerplate
//
//  Created by Abhinand on 03/11/21.
//

import Foundation


protocol ICryptoDataSource{
    func numberOfSections() -> Int
    func numberOfItems(InSection section: Int) -> Int
    func item(at indexPath: IndexPath) -> String?
    func addRecords(cryptoList: [CryptoDetailsDTO]) -> Void
}

class CryptoDataSource: ICryptoDataSource{
    
    var cryptoList: [CryptoDetailsDTO] = []
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfItems(InSection section: Int) -> Int {
        cryptoList.count
    }
    
    func item(at indexPath: IndexPath) -> String? {
        cryptoList[indexPath.row].name
    }
    
    func addRecords(cryptoList: [CryptoDetailsDTO]) {
        self.cryptoList = cryptoList
    }
    
}
