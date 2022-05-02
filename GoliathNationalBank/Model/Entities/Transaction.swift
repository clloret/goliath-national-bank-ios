//
//  Transaction.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation

struct Transaction: Decodable, Equatable {
    let sku: String
    let amount: String
    let currency: String
}
