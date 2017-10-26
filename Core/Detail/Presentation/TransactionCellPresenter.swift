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
        cell.selectionStyle = .none
        if transaction.amount >= 0 {
            cell.nameLabel.text = transaction.receiverDisplayName.uppercased()
            cell.arrowView.image = UIImage(named: "ArrowDown", in: Bundle(for: type(of: self)), compatibleWith: nil)
        } else {
            cell.nameLabel.text = transaction.senderDisplayName.uppercased()
            cell.arrowView.image = UIImage(named: "ArrowUp", in: Bundle(for: type(of: self)), compatibleWith: nil)
        }
        if let date = dateFormatter.date(from: transaction.date) {
            cell.dateLabel.text = outputDateFormatter.string(from: date)
        } else {
            cell.dateLabel.isHidden = true
        }
        
        cell.amountLabel.text = String(format: "%.2f %@", transaction.amount, transaction.currencyCode.rawValue).uppercased()
    }
}
