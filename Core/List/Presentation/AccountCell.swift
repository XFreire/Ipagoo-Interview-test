//
//  AccountCell.swift
//  Core
//
//  Created by Alexandre Freire García on 25/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import UIKit
import RxSwift

final class AccountCell: UITableViewCell, ReusableView, NibLoadableView {
    @IBOutlet weak var cityView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ibanLabel: UILabel!
    @IBOutlet weak var availableBalanceLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var metadataLabel: UILabel!
    
    // MARK: - Properties
    private(set) var disposeBag = DisposeBag()
    
    // MARK: - Overrides
    override func prepareForReuse() {
        super.prepareForReuse()
        cityView.image =  nil
        disposeBag = DisposeBag()
    }
    
}
