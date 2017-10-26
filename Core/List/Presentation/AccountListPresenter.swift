//
//  File.swift
//  Core
//
//  Created by Alexandre Freire García on 25/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import RxSwift

protocol AccountListView: class {
    var title: String? { get set }
    func setLoading(_ loading: Bool)
    func update(with accounts: [Account])
}

final class AccountListPresenter {
    
    // MARK: - Properties
    weak var view: AccountListView?
    private let repository: AccountRepositoryProtocol
    private let detailNavigator: DetailNavigator

    private let disposeBag = DisposeBag()
    
    init(repository: AccountRepositoryProtocol, detailNavigator: DetailNavigator) {
        self.repository = repository
        self.detailNavigator = detailNavigator
    }
    
    func didLoad() {
        self.view?.title = NSLocalizedString("Accounts", comment: "").uppercased()
        loadContents()
    }
    
    func didSelect(account: Account) {
        detailNavigator.showDetail(of: account)
    }
}

private extension AccountListPresenter {
    func loadContents() {
        view?.setLoading(true)
        
        repository.accounts()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] accounts in
                guard let `self` = self else { return }
                self.view?.update(with: accounts)
            },  onDisposed: { [weak self] in
                self?.view?.setLoading(false)
            })
            .disposed(by: disposeBag)
    }
}


