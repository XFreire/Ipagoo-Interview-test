//
//  AccountDetailViewController.swift
//  Core
//
//  Created by Alexandre Freire García on 25/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class AccountDetailViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.register(TransactionCell.self)
            tableView.rowHeight = Constants.rowHeight
            tableView.separatorInset = Constants.separatorInset

        }
    }
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    // MARK: - Properties
    private let presenter: AccountDetailPresenter
    private let cellPresenter: TransactionCellPresenter
    private let cardPresenter: CardPresenter
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Initialization
    init(presenter: AccountDetailPresenter, cellPresenter: TransactionCellPresenter, cardPresenter: CardPresenter) {
        self.presenter = presenter
        self.cellPresenter = cellPresenter
        self.cardPresenter = cardPresenter
        
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

extension AccountDetailViewController: AccountDetailView {
    func setLoading(_ loading: Bool) {
        if loading {
            loadingView.startAnimating()
        } else {
            loadingView.stopAnimating()
        }
    }
    
    func update(with account: Account) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        let cardView = CardView.instantiate()
        cardPresenter.present(account: account, in: cardView)
        
        stackView.addArrangedSubview(cardView)
    }
    
    func update(with transactions: [Transaction]) {
        Observable.from(optional: transactions)
            .bind(to: tableView.rx.items) { [weak self] tableView, _, transaction in
                let cell = tableView.dequeueReusableCell(TransactionCell.self)
                self?.cellPresenter.present(transaction: transaction, in: cell)

                return cell
            }
            .disposed(by: disposeBag)
    }
    
    
}

private extension AccountDetailViewController {
    enum Constants {
        static let separatorInset = UIEdgeInsets(top: 0, left: 64, bottom: 0, right: 0)
        static let rowHeight: CGFloat = 88
    }
}


