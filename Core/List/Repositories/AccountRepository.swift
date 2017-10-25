//
//  AccountRepository.swift
//  Core
//
//  Created by Alexandre Freire García on 25/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import RxSwift

protocol AccountRepositoryProtocol {
    func accounts() -> Observable<[Account]>
}

final class AccountRepository: AccountRepositoryProtocol {
    let ipagooService: IpagooService
    
    init(ipagooService: IpagooService) {
        self.ipagooService = ipagooService
    }
    
    func accounts() -> Observable<[Account]> {
        return ipagooService.load(Page<Account>.self, from: .accounts)
            .map{ $0.items }
    }
}
