//
//  CardPresenter.swift
//  Core
//
//  Created by Alexandre Freire García on 25/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

final class CardPresenter {
    
    func present(account: Account, in card: CardView) {
        card.nameLabel.text = account.name.uppercased()
        card.cityView.image = UIImage(named: account.countryCode.rawValue, in: Bundle(for: type(of: self)), compatibleWith: nil)
        card.ibanLabel.text = account.iban
        card.availableBalanceLabel.text = String(format: "%.2f %@", account.availableBalance, account.currencyCode.rawValue).uppercased()
        card.metadataLabel.text = NSLocalizedString("Available balance", comment: "").uppercased()
        card.countryLabel.text = account.countryCode.rawValue
        
        let views: [UIView] = [card.nameLabel, card.cityView, card.ibanLabel, card.availableBalanceLabel, card.metadataLabel, card.countryLabel]
        if account.status == .active {
            views.forEach{ $0.alpha = 1 }
        } else {
            views.forEach{ $0.alpha = 0.3 }
        }
    }
}
