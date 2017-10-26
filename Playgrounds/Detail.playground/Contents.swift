@testable import Core

import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


let assembly = CoreAssembly(navigationController: UINavigationController())
let account = Account(identifier: 1, name: "My Spanish account", iban: "ES12341987135768235", countryCode: .ES, currencyCode: .EUR, currentBalance: 1400.99, availableBalance: 1390, status: .active, hasCard: true)
let vc = assembly.detailAssembly.detailViewController(account: account)

vc.view.frame = CGRect(x: 0, y: 0, width: 475, height: 667)

PlaygroundPage.current.liveView = vc
