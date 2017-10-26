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
}

final class AccountDetailPresenter {
    
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
        loadContents()
    }
}

private extension AccountDetailPresenter {
    func loadContents() {
        self.view?.setLoading(true)
        
        repository.account(withIdentifier: account.identifier)
            .subscribe(onNext: { [weak self] accountDetail in
                guard let `self` = self else { return }
                self.view?.update(with: accountDetail.transactions)
            },  onDisposed: { [weak self] in
                self?.view?.setLoading(false)
            })
            .disposed(by: disposeBag)
    }
}
