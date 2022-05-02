//
//  TestData.swift
//  GoliathNationalBankTests
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation
@testable import GoliathNationalBank

class TestData {
    static let currencies = [
        "CAD",
        "AUD",
        "EUR",
        "USD",
    ]

    static let enoughtRates = [
        Rate(from: "CAD", to: "AUD", rate: "0.92"),
        Rate(from: "AUD", to: "CAD", rate: "1.09"),
        Rate(from: "CAD", to: "EUR", rate: "0.63"),
        Rate(from: "EUR", to: "CAD", rate: "1.59"),
        Rate(from: "AUD", to: "USD", rate: "0.81"),
        Rate(from: "USD", to: "AUD", rate: "1.23"),
    ]

    static let insufficientRates = [
        Rate(from: "CAD", to: "AUD", rate: "0.92"),
        Rate(from: "AUD", to: "CAD", rate: "1.09"),
        Rate(from: "AUD", to: "USD", rate: "0.81"),
    ]

    static let transactions = [
        Transaction(sku: "X0001", amount: "100.0", currency: "CAD"),
        Transaction(sku: "X0002", amount: "50.0", currency: "EUR"),
    ]

    static let product = Product(sku: "X0001", transactions: transactions)
}
