//
//  Account.swift
//  Core
//
//  Created by Alexandre Freire García on 25/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

struct Account: Decodable {
    let identifier: Int
    let name: String
    let iban: String
    let countryCode: CountryCode
    let currencyCode: CurrencyCode
    let currentBalance: Double
    let availableBalance: Double
    let status: AccountStatus
    let hasCard: Bool
    
    private enum CodingKeys: String, CodingKey {
        case identifier = "Id"
        case name = "Name"
        case iban = "Iban"
        case countryCode = "CountryCode"
        case currencyCode = "CurrencyCode"
        case currentBalance = "CurrentBalance"
        case availableBalance = "AvailableBalance"
        case status = "Status"
        case hasCard = "HasCard"
        
    }
}
