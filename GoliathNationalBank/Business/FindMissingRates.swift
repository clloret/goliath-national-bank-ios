//
//  FindMissingRates.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation

class FindMissingRates {
    private var rates: [Rate] = []
    private var rateChecked: Set<String> = Set()

    private func getCurrencyRate(from: String, to: String) -> Decimal {
        rateChecked.removeAll()
        return getRecursiveRate(from: from, to: to, previousRate: 1)
    }

    private func getRecursiveRate(from: String, to: String, previousRate: Decimal) -> Decimal {
        let rateBetween: Decimal = getRateBetween(from: from, to: to)
        print("From: \(from) To: \(to) Rate: \(rateBetween) Previous Rate: \(previousRate)")
        if rateBetween != 0 {
            return previousRate * rateBetween
        } else {
            rateChecked.insert(from)
            for rate in rates {
                if rate.from == from, !rateChecked.contains(rate.to) {
                    print(rate)
                    let foundRate = getRecursiveRate(from: rate.to, to: to,
                                                     previousRate: previousRate * rate.rate.decimalValueOrZero)
                    if foundRate != 0 {
                        return foundRate
                    }
                }
            }
        }

        return 0
    }

    private func getRateBetween(from: String, to: String) -> Decimal {
        return rates.first(where: { $0.from == from && $0.to == to })?.rate.decimalValueOrZero ?? 0
    }
}

extension FindMissingRates: FindMissingRatesProtocol {
    func setRates(rates: [Rate]) {
        self.rates = rates
    }

    func checkMissingRates(from currencies: [String]) -> [Rate] {
        let currenciesOtherThanEuros = currencies.filter {
            $0 != AppConstants.currency
        }
        var allRates = Array(rates)
        currenciesOtherThanEuros.forEach { currency in
            let rate = rates.first(where: { $0.from == currency && $0.to == AppConstants.currency })
            if rate == nil {
                print("\(currency) rate is missing")

                let foundRate = getCurrencyRate(from: currency, to: AppConstants.currency)
                print("\(currency) found rate is \(foundRate)")

                let textRate = NSDecimalNumber(decimal: foundRate).stringValue
                let newRate = Rate(from: currency, to: AppConstants.currency, rate: textRate)
                allRates.append(newRate)
            }
        }
        return allRates
    }
}
