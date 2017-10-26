//
//  AccountView.swift
//  Core
//
//  Created by Alexandre Freire García on 25/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import UIKit

final class CardView: UIView, NibLoadableView {
    private enum Constants {
        static let height: CGFloat = 175
    }
    @IBOutlet weak var cityView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ibanLabel: UILabel!
    @IBOutlet weak var availableBalanceLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var metadataLabel: UILabel!
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: Constants.height)
    }
}
