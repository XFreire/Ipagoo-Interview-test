//
//  Transaction.swift
//  Core
//
//  Created by Alexandre Freire García on 25/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

struct Transaction: Decodable {
    let identifier: Int
    let date: String
    let reference: String
    let amount: Double
    let currencyCode: CurrencyCode
    let status: TransactionStatus
    let senderDisplayName: String
    let senderInitials: String
    let senderAccountNumber: String
    let receiverDisplayName: String
    let receiverInitials: String
    let receiverAccountNumber: String?
    
    private enum CodingKeys: String, CodingKey {
        case identifier = "TransactionId"
        case date = "Date"
        case reference = "Reference"
        case amount = "Amount"
        case currencyCode = "CurrencyCode"
        case status = "Status"
        case senderDisplayName = "SenderDisplayName"
        case senderInitials = "SenderInitials"
        case senderAccountNumber = "SenderAccountNumber"
        case receiverDisplayName = "ReceiverDisplayName"
        case receiverInitials = "ReceiverInitials"
        case receiverAccountNumber = "ReceiverAccountNumber"
    }
}
