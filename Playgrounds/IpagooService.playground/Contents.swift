//: Playground - noun: a place where people can play

@testable import Core
import RxSwift

let service = IpagooService()
let disposeBag = DisposeBag()

service.load(Page<Account>.self, from: .accounts)
    .map{ $0.items }
    .subscribe(onNext: { accounts in
        print(accounts)
    }, onError: { error in
        print("Error: \(error)")
    })

//service.load(AccountDetail.self, from: .account(identifier: 1))
//    .subscribe(onNext: { account in
//        print(account.transactions)
//        print(account.currentBalance)
//        print(account.transactions)
//    }, onError: { error in
//        print("Error: \(error)")
//    })


