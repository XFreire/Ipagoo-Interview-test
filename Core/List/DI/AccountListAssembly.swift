//
//  AccountListAssembly.swift
//  Core
//
//  Created by Alexandre Freire García on 26/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

final public class ListAccountAssembly {
    private let ipagooServiceAssembly: IpagooServiceAssembly
    private let detailAssembly: DetailAssembly
    
    init(ipagooServiceAssembly: IpagooServiceAssembly, detailAssembly: DetailAssembly) {
        self.ipagooServiceAssembly = ipagooServiceAssembly
        self.detailAssembly = detailAssembly
    }
    
    public func viewController() -> UIViewController {
        return AccountListViewController(presenter: presenter(), cellPresenter: cellPresenter())
    }
    
    func presenter() -> AccountListPresenter {
        return AccountListPresenter(repository: accountRepository(), detailNavigator: detailAssembly.detailNavigator())
    }
    
    func cellPresenter() -> AccountCellPresenter {
        return AccountCellPresenter()
    }
    
    func accountRepository() -> AccountRepositoryProtocol {
        return AccountRepository(ipagooService: ipagooServiceAssembly.ipagooService)
    }
}
