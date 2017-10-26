//
//  IpagooServiceAssembly.swift
//  Core
//
//  Created by Alexandre Freire García on 26/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

final class IpagooServiceAssembly {
    private(set) lazy var ipagooService = IpagooService()
    
    private(set) lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    
        return formatter
    }()
}
