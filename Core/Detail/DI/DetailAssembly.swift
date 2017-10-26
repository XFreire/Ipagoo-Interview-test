//
//  DetailAssembly.swift
//  Core
//
//  Created by Alexandre Freire García on 26/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

final public class DetailAssembly {
    private let ipagooServiceAssembly: IpagooServiceAssembly
    private let navigationController: UINavigationController
    
    init(ipagooServiceAssembly: IpagooServiceAssembly, navigationController: UINavigationController) {
        self.ipagooServiceAssembly = ipagooServiceAssembly
        self.navigationController = navigationController
    }
    
    func presenter(account: Account) -> AccountDetailPresenter {
        return AccountDetailPresenter(repository: repository(), account: account)
    }
    
    func cellPresener() -> TransactionCellPresenter {
        return TransactionCellPresenter(dateFormatter: ipagooServiceAssembly.dateFormatter)
    }
    
    func cardPresenter() -> CardPresenter {
        return CardPresenter()
    }
    
    func repository() -> AccountRepositoryProtocol{
        return AccountRepository(ipagooService: ipagooServiceAssembly.ipagooService)
    }
    
    func detailNavigator() -> DetailNavigator {
        return PhoneDetailNavigator(navigationController: navigationController, viewControllerProvider: self)
    }
}

extension DetailAssembly: DetailViewControllerProvider {
    func detailViewController(account: Account) -> UIViewController {
        return AccountDetailViewController(presenter: presenter(account: account), cellPresenter: cellPresener(), cardPresenter: cardPresenter())
    }
}


