//
//  AccountRepositoryMock.swift
//  IpagooTests
//
//  Created by Alexandre Freire García on 26/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation
import RxSwift
@testable import Core

final class AccountRepositoryMock: AccountRepositoryProtocol {

    private(set) var accountsCalled = false
    var accountsResult = Observable<[Account]>.just([])

    private(set) var accountWithIdentifierCalled = false
    var accountWithIdentifierResult = Observable<AccountDetail>.empty()

    func accounts() -> Observable<[Account]> {
        accountsCalled = true
        return accountsResult
    }
    
    func account(withIdentifier identifier: Int) -> Observable<AccountDetail> {
        accountWithIdentifierCalled = true
        return accountWithIdentifierResult
    }
    
    
}
