//
//  CoreAssembly.swift
//  Core
//
//  Created by Alexandre Freire García on 26/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

final public class CoreAssembly {

    public private(set) lazy var listAssembly = ListAccountAssembly(ipagooServiceAssembly: ipagooServiceAssembly, detailAssembly: detailAssembly)
    private(set) lazy var ipagooServiceAssembly = IpagooServiceAssembly()
    private(set) lazy var detailAssembly = DetailAssembly(ipagooServiceAssembly: ipagooServiceAssembly, navigationController: navigationController)
    
    private let navigationController: UINavigationController

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
