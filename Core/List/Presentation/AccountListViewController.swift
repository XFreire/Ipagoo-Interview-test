//
//  AccountListViewController.swift
//  Core
//
//  Created by Alexandre Freire García on 25/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AccountListViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.register(AccountCell.self)
            tableView.separatorColor = .clear
        }
    }
    
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    // MARK: - Properties
    private let presenter: AccountListPresenter
    private let cellPresenter: AccountCellPresenter
    private let disposeBag = DisposeBag()
    
    // MARK: - Initialization
    init(presenter: AccountListPresenter, cellPresenter: AccountCellPresenter) {
        self.presenter = presenter
        self.cellPresenter = cellPresenter
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        presenter.didLoad()
    }
}

extension AccountListViewController: AccountListView {
    func setLoading(_ loading: Bool) {
        if loading {
            loadingView.startAnimating()
        } else {
            loadingView.stopAnimating()
        }
    }
    
    func update(with accounts: [Account]) {
        Observable.from(optional: accounts)
            .bind(to: tableView.rx.items) { [weak self] tableView, _, account in
                let cell = tableView.dequeueReusableCell(AccountCell.self)
                self?.cellPresenter.present(account: account, in: cell)
                
                return cell
            }
            .disposed(by: disposeBag)
    }
    
    
}


