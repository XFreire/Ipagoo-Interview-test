@testable import Core

import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let cell = AccountCell.instantiate()
cell.backgroundColor = .white
let presenter = AccountCellPresenter()

let account = Account(identifier: 1, name: "My Spanish account", iban: "ES4067060001870000000099", countryCode: .ES, currencyCode: .EUR, currentBalance: 1500, availableBalance: 1500, status: .active, hasCard: true)

presenter.present(account: account, in: cell)

PlaygroundPage.current.liveView = cell


