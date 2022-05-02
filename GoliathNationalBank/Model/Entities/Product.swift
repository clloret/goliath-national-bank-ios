//
//  Product.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation

struct Product: Equatable {
    let sku: String
    let transactions: [Transaction]
}
