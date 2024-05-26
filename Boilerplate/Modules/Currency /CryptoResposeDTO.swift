//
//  CryptoResposeDTO.swift
//  Boilerplate
//
//  Created by Abhinand on 02/11/21.
//

import Foundation


// MARK: - CryptoDetail
struct CryptoDetailsDTO: Codable {
    let genus, name: String
    let id: Int
    let family, order: String
    let nutritions: Nutritions
}

// MARK: - Nutritions
struct Nutritions: Codable {
    let carbohydrates, protein, fat: Double
    let calories: Int
    let sugar: Double
}

