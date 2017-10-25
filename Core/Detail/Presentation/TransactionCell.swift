//
//  TransactionCell.swift
//  Core
//
//  Created by Alexandre Freire García on 25/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import UIKit
import RxSwift

final class TransactionCell: UITableViewCell, NibLoadableView, ReusableView {

    @IBOutlet weak var arrowView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    // MARK: - Properties
    private(set) var disposeBag = DisposeBag()
    
    // MARK: - Overrides
    override func prepareForReuse() {
        super.prepareForReuse()
        arrowView.image =  nil
        disposeBag = DisposeBag()
    }
    
}
