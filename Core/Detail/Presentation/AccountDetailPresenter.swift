//
//  AccountDetailPresenter.swift
//  Core
//
//  Created by Alexandre Freire García on 26/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import RxSwift

protocol AccountDetailView: class {
    var title: String? { get set }
    func setLoading(_ loading: Bool)
    func update(with account: Account)
    func update(with transactions: [Transaction])
    func enableEmptyContentMode()
    func disableEmptyContentMode()
}

final class AccountDetailPresenter {
    
    enum TransactionDisplayOption: Int {
        case all, debits, credits
    }
    
    // MARK: - Properties
    weak var view: AccountDetailView?
    private let account: Account
    private let repository: AccountRepositoryProtocol
    
    private let disposeBag = DisposeBag()
    
    init(repository: AccountRepositoryProtocol, account: Account) {
        self.repository = repository
        self.account = account
    }
    
    func didLoad() {
        self.view?.title = NSLocalizedString("Detail", comment: "").uppercased()
        self.view?.update(with: account)
    }
    
    func didSelect(displayOption: TransactionDisplayOption) {
        loadContents(option: displayOption)
        
    }
}

private extension AccountDetailPresenter {
    func loadContents(option: TransactionDisplayOption) {
        self.view?.setLoading(true)
        
        repository.account(withIdentifier: account.identifier)
            .map{ [weak self] accountDetail in
                 self?.transactions(accountDetail.transactions, of: option) ?? []
            }
            .do(onNext: { [weak self] transactions in
                if transactions.isEmpty {
                    self?.view?.enableEmptyContentMode()
                } else {
                    self?.view?.disableEmptyContentMode()
                }
            })
            .subscribe(onNext: { [weak self] transactions in
                guard let `self` = self else { return }
                self.view?.update(with: transactions)
            },  onDisposed: { [weak self] in
                self?.view?.setLoading(false)
            })
            .disposed(by: disposeBag)
    }
    
    private func transactions(_ transactions: [Transaction], of option: TransactionDisplayOption) -> [Transaction] {
        switch option {
        case .all: return transactions
        case .debits:
            return transactions.filter{ $0.amount < 0}
        case .credits:
            return transactions.filter{ $0.amount > 0}

        }
    }
}
