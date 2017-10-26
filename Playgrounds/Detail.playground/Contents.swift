@testable import Core

import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


let service = IpagooService()
let repository = AccountRepository(ipagooService: service)
let account = Account(identifier: 1, name: "My Spanish account", iban: "ES12341987135768235", countryCode: .ES, currencyCode: .EUR, currentBalance: 1400.99, availableBalance: 1390, status: .active, hasCard: true)
let presenter = AccountDetailPresenter(repository: repository, account: account)
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

let cellPresenter = TransactionCellPresenter(dateFormatter: dateFormatter)
let vc = AccountDetailViewController(presenter: presenter, cellPresenter: cellPresenter, cardPresenter: CardPresenter())
vc.view.frame = CGRect(x: 0, y: 0, width: 475, height: 667)

let img = UIImage(named: "ArrowUp")
PlaygroundPage.current.liveView = vc
