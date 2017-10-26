//
//  TransactionCellPresenter.swift
//  Core
//
//  Created by Alexandre Freire García on 26/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

final class TransactionCellPresenter {
    
    let dateFormatter: DateFormatter
    
    init(dateFormatter: DateFormatter) {
        self.dateFormatter = dateFormatter
    }
    
    func present(transaction: Transaction, in cell: TransactionCell) {
        if transaction.amount > 0 {
            cell.nameLabel.text = transaction.receiverDisplayName
        } else {
            cell.nameLabel.text = transaction.senderDisplayName
        }
    
        if let date = dateFormatter.date(from: transaction.date) {
            cell.dateLabel.text = dateFormatter.string(from: date)
        }
        
        cell.amountLabel.text = String(format: "%.2f %@", transaction.amount, transaction.currencyCode.rawValue).uppercased()
    }
}
