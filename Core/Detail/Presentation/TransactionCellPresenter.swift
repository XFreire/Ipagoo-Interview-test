//
//  TransactionCellPresenter.swift
//  Core
//
//  Created by Alexandre Freire García on 26/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

final class TransactionCellPresenter {
    
    private let dateFormatter: DateFormatter
    private let outputDateFormatter = DateFormatter()
    
    init(dateFormatter: DateFormatter) {
        self.dateFormatter = dateFormatter
        outputDateFormatter.dateStyle = .medium
    }
    
    func present(transaction: Transaction, in cell: TransactionCell) {
        if transaction.amount > 0 {
            cell.nameLabel.text = transaction.receiverDisplayName.uppercased()
        } else {
            cell.nameLabel.text = transaction.senderDisplayName.uppercased()
        }
        if let date = dateFormatter.date(from: transaction.date) {
            cell.dateLabel.text = outputDateFormatter.string(from: date)
        } else {
            cell.dateLabel.isHidden = true
        }
        
        cell.amountLabel.text = String(format: "%.2f %@", transaction.amount, transaction.currencyCode.rawValue).uppercased()
    }
}
