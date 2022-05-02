//
//  CurrencyRatesTests.swift
//  GoliathNationalBank
//
//  Created by Carlos Lloret Playan on 18/10/21.
//

@testable import GoliathNationalBank
import XCTest

class CurrencyRatesTests: XCTestCase {
    func test_getRateBetween_whenRateExist_returnCorrectValue() {
        let sut = CurrencyRates.shared
        sut.setRates(rates: TestData.enoughtRates)

        let result = sut.getRateBetween(from: "CAD", to: "EUR")

        XCTAssertEqual(result, 0.63)
    }

    func test_getRateBetween_whenRateDoesNotExist_returnRateOne() {
        let sut = CurrencyRates.shared
        sut.setRates(rates: TestData.enoughtRates)

        let result = sut.getRateBetween(from: "USD", to: "EUR")

        XCTAssertEqual(result, 1.0)
    }
}
