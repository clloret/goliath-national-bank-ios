//
//  FindMissingRatesMock.swift
//  GoliathNationalBankTests
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation
@testable import GoliathNationalBank

class FindMissingRatesMock: FindMissingRatesProtocol {
    func setRates(rates: [Rate]) {}

    func checkMissingRates(from currencies: [String]) -> [Rate] {
        return []
    }
}
