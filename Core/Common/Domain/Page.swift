//
//  Response.swift
//  Core
//
//  Created by Alexandre Freire García on 25/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

struct Page<T: Decodable>: Decodable {
    let totalCount: Int
    let items: [T]
    
    private enum CodingKeys: String, CodingKey {
        case totalCount = "TotalCount"
        case items = "Items"
    }
}
