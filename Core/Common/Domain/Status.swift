//
//  Status.swift
//  Core
//
//  Created by Alexandre Freire García on 25/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

enum AccountStatus: String, Decodable {
    case active = "Active"
    case inactive = "Inactive"
}

enum TransactionStatus: String, Decodable {
    case authorised = "Authorised"
    case completed = "Completed"
    case failed = "Failed"
    case pending = "Pending"
}
