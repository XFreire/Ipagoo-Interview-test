@testable import Core

import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let assembly = CoreAssembly(navigationController: UINavigationController())
let vc = assembly.listAssembly.viewController()

vc.view.frame = CGRect(x: 0, y: 0, width: 475, height: 667)

PlaygroundPage.current.liveView = vc


