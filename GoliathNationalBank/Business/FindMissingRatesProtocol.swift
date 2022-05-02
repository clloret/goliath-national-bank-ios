//
//  FindMissingRatesProtocol.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

import Foundation

protocol FindMissingRatesProtocol {
    func setRates(rates: [Rate])
    func checkMissingRates(from currencies: [String]) -> [Rate]
}
