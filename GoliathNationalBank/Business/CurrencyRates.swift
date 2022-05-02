//
//  CurrencyRates.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation

class CurrencyRates {
    private var rates: [Rate] = []

    static var shared = CurrencyRates()

    private init() {}

    func setRates(rates: [Rate]) {
        self.rates = rates
    }

    func getRateBetween(from: String, to: String) -> Decimal {
        return rates.first(where: { $0.from == from && $0.to == to })?.rate.decimalValueOrZero ?? 1
    }
}
