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

protocol DetailViewControllerProvider: class {
    func detailViewController(account: Account) -> UIViewController
}

final class AccountDetailViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.register(TransactionCell.self)
            tableView.rowHeight = Constants.rowHeight
            tableView.separatorInset = Constants.separatorInset

        }
    }
    @IBOutlet weak var emptyContentModeLabel: UILabel!
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
        segmentedControl.rx.selectedSegmentIndex
            .subscribe(onNext: { [weak self] index in
                guard let `self` = self, let option = AccountDetailPresenter.TransactionDisplayOption(rawValue: index) else { return }
                
                self.presenter.didSelect(displayOption: option)
            })
            .disposed(by: disposeBag)
    }
}

extension AccountDetailViewController: AccountDetailView {
    func disableEmptyContentMode() {
        tableView.isHidden = false
        emptyContentModeLabel.isHidden = true
    }
    
    func enableEmptyContentMode() {
        emptyContentModeLabel.text = NSLocalizedString("There are no recent transactions yet", comment: "")
        tableView.isHidden = true
        emptyContentModeLabel.isHidden = false
    }
    
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
