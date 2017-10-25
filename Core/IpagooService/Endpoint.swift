//
//  Endpoint.swift
//  Core
//
//  Created by Alexandre Freire García on 25/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

internal enum Endpoint {
    case accounts
    case account(identifier: Int)
}

internal extension Endpoint {
    var path: String {
        switch self {
        case .accounts:
            return "accounts"
        case .account(let identifier):
            return "\(identifier)"
        }
    }
}
