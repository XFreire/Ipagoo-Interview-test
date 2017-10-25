@testable import Core

import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let service = IpagooService()
let repository = AccountRepository(ipagooService: service)
let vc = AccountListViewController(presenter: AccountListPresenter(repository: repository), cellPresenter: AccountCellPresenter())
vc.view.frame = CGRect(x: 0, y: 0, width: 475, height: 667)

PlaygroundPage.current.liveView = vc


