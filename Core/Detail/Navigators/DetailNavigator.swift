//
//  DetailNavigator.swift
//  Core
//
//  Created by Alexandre Freire García on 26/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

protocol DetailNavigator {
    func showDetail(of account: Account)
}

final class PhoneDetailNavigator: DetailNavigator {
    
    // MARK: - Properties
    private let navigationController: UINavigationController
    private unowned let viewControllerProvider: DetailViewControllerProvider
    
    init(navigationController: UINavigationController, viewControllerProvider: DetailViewControllerProvider) {
        self.navigationController = navigationController
        self.viewControllerProvider = viewControllerProvider
    }
    func showDetail(of account: Account) {
        let viewController = viewControllerProvider.detailViewController(account: account)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    
}
