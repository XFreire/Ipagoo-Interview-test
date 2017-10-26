//
//  AccountCellPresenter.swift
//  Core
//
//  Created by Alexandre Freire García on 25/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

final class AccountCellPresenter {
    
    func present(account: Account, in cell: AccountCell) {
        cell.nameLabel.text = account.name.uppercased()
        cell.cityView.image = UIImage(named: account.countryCode.rawValue, in: Bundle(for: type(of: self)), compatibleWith: nil)
        cell.ibanLabel.text = account.iban
        cell.availableBalanceLabel.text = String(format: "%.2f %@", account.availableBalance, account.currencyCode.rawValue).uppercased()
        cell.metadataLabel.text = NSLocalizedString("Available balance", comment: "").uppercased()
        cell.countryLabel.text = account.countryCode.rawValue
        let views: [UIView] = [cell.nameLabel, cell.cityView, cell.ibanLabel, cell.availableBalanceLabel, cell.metadataLabel, cell.countryLabel]
        if account.status == .active {
            views.forEach{ $0.alpha = 1 }
        } else {
            views.forEach{ $0.alpha = 0.3 }
        }
    }
}
