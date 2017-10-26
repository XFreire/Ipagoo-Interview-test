//
//  ListPresenterTest.swift
//  IpagooTests
//
//  Created by Alexandre Freire García on 26/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import XCTest
@testable import Core

class ListPresenterTest: XCTestCase {
    
    var sut: AccountListPresenter!
    
    // Collaborators
    var detailNavigatorMock: DetailNavigatorMock!
    var accountRepositoryMock: AccountRepositoryMock!
    
    override func setUp() {
        super.setUp()
        detailNavigatorMock = DetailNavigatorMock()
        accountRepositoryMock = AccountRepositoryMock()
        
        sut = AccountListPresenter(repository: accountRepositoryMock, detailNavigator: detailNavigatorMock)
    }
    

    func testAccountListPresenter_didSelectAccocunt_navigatesToAccountDetail() {
        //Given
        let account = Account(identifier: 1, name: "Test", iban: "ES1982751289576224", countryCode: .ES, currencyCode: .EUR, currentBalance: 1000, availableBalance: 1000, status: .active, hasCard: true)
        
        // When
        sut.didSelect(account: account)
        
        // Then navigates to account detail
        XCTAssertTrue(detailNavigatorMock.accountDetailCalled)
        let (accountParameter) = detailNavigatorMock.accountDetailParameters!
        XCTAssertEqual(1, accountParameter.identifier)
        XCTAssertEqual("Test", accountParameter.name)
        XCTAssertEqual("ES1982751289576224", accountParameter.iban)
        XCTAssertEqual(CountryCode.ES, accountParameter.countryCode)
        XCTAssertEqual(CurrencyCode.EUR, accountParameter.currencyCode)
        
    }
    
}
