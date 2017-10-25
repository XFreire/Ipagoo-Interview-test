//
//  AccountDetailViewController.swift
//  Core
//
//  Created by Alexandre Freire García on 25/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import UIKit

final class AccountDetailViewController: UIViewController {

    @IBOutlet weak var cardView: CardView!
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.register(TransactionCell.self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
