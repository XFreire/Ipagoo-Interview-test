//
//  AccountDetail.swift
//  Core
//
//  Created by Alexandre Freire García on 25/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

struct AccountDetail: Decodable {
    
    let currentBalance: Double
    let availableBalance: Double
    let transactions: [Transaction]
    
    private enum CodingKeys: String, CodingKey {
        case currentBalance = "CurrentBalance"
        case availableBalance = "AvailableBalance"
        case transactions = "Items"
    }
}
