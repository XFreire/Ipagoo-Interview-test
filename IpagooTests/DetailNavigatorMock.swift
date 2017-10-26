//
//  DetailNavigatorMock.swift
//  IpagooTests
//
//  Created by Alexandre Freire García on 26/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

@testable import Core

final class DetailNavigatorMock: DetailNavigator {
    
    private(set) var accountDetailCalled = false
    private(set) var accountDetailParameters: (Account)?
    
    func showDetail(of account: Account) {
        accountDetailCalled = true
        accountDetailParameters = (account)
    }
}
